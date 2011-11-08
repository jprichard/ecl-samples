IMPORT ML;
IMPORT ML.Types AS Types;
IMPORT ML.Cluster.DF AS DF;
KMeans:=ML.Cluster.KMeans;

unsigned4 InDocumentCount := 0 : STORED('DocumentCount');
unsigned2 InCentroidCount := 0 : STORED('CentroidCount');
unsigned1 InInterations := 0 : STORED('NumberOfIterations');


ML.Types.NumericField CreateElements(UNSIGNED iRows,UNSIGNED iFields=2,UNSIGNED iBeginAt=1,iMaxVal=1000):=FUNCTION
  d01:=DATASET([{0,0,0}],ML.Types.NumericField);
  d02:=NORMALIZE(d01,iRows*iFields,TRANSFORM(ML.Types.NumericField,SELF.id:=((COUNTER-1)/iFields+1)+(iBeginAt-1);SELF.number:=(COUNTER-1)%iFields+1;SELF.value:=RANDOM()%iMaxVal;));
  RETURN d02;
END;

KMeansNAsArray(DATASET(Types.NumericField) d01,DATASET(Types.NumericField) d02,UNSIGNED i,DF.Default fDist=DF.Euclidean):=FUNCTION
    dToSet:=TABLE(d02,{id;number;SET OF TYPEOF(d02.value) values:=[value]});
    dNewPositions:=LOOP(dToSet,i,JOIN(ROWS(LEFT),KMeans(d01,TABLE(ROWS(LEFT),{id;number;TYPEOF(d02.value) value:=values[COUNTER];}),fDist),LEFT.id=RIGHT.id AND LEFT.number=RIGHT.number,TRANSFORM(RECORDOF(dToSet),SELF.values:=LEFT.values+[RIGHT.value];SELF:=LEFT;)));
    dNormalized:=SORT(NORMALIZE(dNewPositions,i,TRANSFORM({UNSIGNED i;Types.NumericField;STRING s;},SELF.i:=COUNTER;SELF.value:=LEFT.values[COUNTER];SELF.s:=(STRING)SELF.value;SELF:=LEFT;)),i,id,number);
    d01WithS:=TABLE(d01,{d01;STRING s:=(STRING)value;});
    dDocumentsRolled:=ROLLUP(SORT(d01WithS,id,number),LEFT.id!=-RIGHT.id,TRANSFORM(RECORDOF(d01WithS),SELF.s:=LEFT.s+IF(LEFT.number<RIGHT.number,',','],[')+RIGHT.s;SELF:=RIGHT;));
    dCentroidsRolled:=ROLLUP(dNormalized,LEFT.i!=-RIGHT.i,TRANSFORM(RECORDOF(dNormalized),SELF.s:=LEFT.s+IF(LEFT.i=RIGHT.i,IF(LEFT.number<RIGHT.number,',','],['),']],[[')+RIGHT.s;SELF:=RIGHT;));
    sCentroids:='var vertices=[[['+dCentroidsRolled[1].s+']]];';
    sDocuments:='var documents=[['+dDocumentsRolled[1].s+']];';
    RETURN DATASET([{sDocuments},{sCentroids}],{STRING s});
END;

dData:=CreateElements(InDocumentCount);
dCentroids:=CreateElements(InCentroidCount,,InDocumentCount+1);
KMeansNAsArray(dData,dCentroids,InInterations);
