DROP TABLE IF EXISTS `parts`;
CREATE TABLE IF NOT EXISTS `parts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `binaryID` bigint(20) unsigned NOT NULL DEFAULT '0',
  `messageID` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `number` bigint(20) unsigned NOT NULL DEFAULT '0',
  `partnumber` int(10) unsigned NOT NULL DEFAULT '0',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0',
  `parthash` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `dateadd` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `collectionID` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`collectionID`, `binaryID`),
  UNIQUE KEY `parthash` (`parthash`, `collectionID`, `binaryID`),
  KEY `ix_binID_partnum` (`binaryID`,`partnumber`),
  KEY `ix_colID_size` (`collectionID`,`size`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=347448479 
	PARTITION BY LIST (MOD(collectionID,50))
	SUBPARTITION BY HASH(binaryID)
    SUBPARTITIONS 2 (
    PARTITION p0 VALUES IN (0),
    PARTITION p1 VALUES IN (1),
    PARTITION p2 VALUES IN (2),
    PARTITION p3 VALUES IN (3),
	PARTITION p4 VALUES IN (4),
	PARTITION p5 VALUES IN (5),
	PARTITION p6 VALUES IN (6),
	PARTITION p7 VALUES IN (7),
	PARTITION p8 VALUES IN (8),
	PARTITION p9 VALUES IN (9),
	PARTITION p10 VALUES IN (10),
	PARTITION p11 VALUES IN (11),
	PARTITION p12 VALUES IN (12),
	PARTITION p13 VALUES IN (13),
	PARTITION p14 VALUES IN (14),
	PARTITION p15 VALUES IN (15),
	PARTITION p16 VALUES IN (16),
	PARTITION p17 VALUES IN (17),
	PARTITION p18 VALUES IN (18),
	PARTITION p19 VALUES IN (19),
	PARTITION p20 VALUES IN (20),
	PARTITION p21 VALUES IN (21),
	PARTITION p22 VALUES IN (22),
	PARTITION p23 VALUES IN (23),
	PARTITION p24 VALUES IN (24),
	PARTITION p25 VALUES IN (25),
	PARTITION p26 VALUES IN (26),
	PARTITION p27 VALUES IN (27),
	PARTITION p28 VALUES IN (28),
	PARTITION p29 VALUES IN (29),
	PARTITION p30 VALUES IN (30),
	PARTITION p31 VALUES IN (31),
	PARTITION p32 VALUES IN (32),
	PARTITION p33 VALUES IN (33),
	PARTITION p34 VALUES IN (34),
	PARTITION p35 VALUES IN (35),
	PARTITION p36 VALUES IN (36),
	PARTITION p37 VALUES IN (37),
	PARTITION p38 VALUES IN (38),
	PARTITION p39 VALUES IN (39),
	PARTITION p40 VALUES IN (40),
	PARTITION p41 VALUES IN (41),
	PARTITION p42 VALUES IN (42),
	PARTITION p43 VALUES IN (43),
	PARTITION p44 VALUES IN (44),
	PARTITION p45 VALUES IN (45),
	PARTITION p46 VALUES IN (46),
	PARTITION p47 VALUES IN (47),
	PARTITION p48 VALUES IN (48),
	PARTITION p49 VALUES IN (49)
);
