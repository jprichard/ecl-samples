myrecord := RECORD
	STRING Country;
	INTEGER Population;
END;

mydataset := DATASET(
	[
		{'China', 1339724852},
		{'India', 1210193422},
		{'United States', 312068000},
		{'Indonesia', 237556363},
		{'Brazil', 190732694},
		{'Pakistan', 177038000},
		{'Nigeria', 158423000},
		{'Bangladesh', 151152000},
		{'Russia', 142905200},
		{'Japan', 127950000},
		{'Mexico', 112336538},
		{'Philippines', 94013200},
		{'Vietnam', 87375000},
		{'Ethiopia', 82101998},
		{'Germany', 81751602},
		{'Egypt', 80721000},
		{'Iran', 75593000},
		{'Turkey', 73722988},
		{'Thailand', 67041000},
		{'Congo', 65966000},
		{'France', 63182000},
		{'United Kingdom', 62435709},
		{'Italy', 60626442},
		{'South Africa', 50586757},
		{'South Korea', 48988833},
		{'Myanmar', 47963000},
		{'Spain', 46125154},
		{'Colombia', 46127000},
		{'Ukraine', 45706126},
		{'Tanzania', 43187823},
		{'Argentina', 40091359},
		{'Kenya', 38610097},
		{'Poland', 38186860},
		{'Algeria', 36300000},
		{'Canada', 34562000},
		{'Morocco', 32241000},
		{'Uganda', 31800000},
		{'Iraq', 31672000},
		{'Afghanistan', 31412000},
		{'Sudan', 30894000},
		{'Peru', 29461933},
		{'Venezuela', 29341000},
		{'Nepal', 28584975},
		{'Malaysia', 27565821},
		{'Uzbekistan', 27445000 },
		{'Saudi Arabia', 27136977},
		{'Ghana', 24233431},
		{'North Korea', 24052231},
		{'Syria', 23695000},
		{'Taiwan', 23188078}
	],  myrecord);

output(mydataset, named('PieChart_Top_Countries_By_Population'));
output(mydataset, named('GeoChart_Top_Countries_By_Population'));
output(mydataset, named('Default_Top_Countries_By_Population'));
