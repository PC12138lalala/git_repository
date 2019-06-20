/*
 Navicat Premium Data Transfer

 Source Server         : RockStarGmaes_mysql
 Source Server Type    : MySQL
 Source Server Version : 80016
 Source Host           : localhost:3306
 Source Schema         : rockstargames

 Target Server Type    : MySQL
 Target Server Version : 80016
 File Encoding         : 65001

 Date: 20/06/2019 14:40:16
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for forum
-- ----------------------------
DROP TABLE IF EXISTS `forum`;
CREATE TABLE `forum`  (
  `USERID` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'GRAND THEFT AUTO V',
  `ID` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TITLE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CONTENT` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `MDATE` datetime(0) NOT NULL,
  `ISLOCKED` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `ISDELETE` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `ISTOP` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK_NAME`(`NAME`) USING BTREE,
  INDEX `FK_USERID2`(`USERID`) USING BTREE,
  CONSTRAINT `FK_NAME` FOREIGN KEY (`NAME`) REFERENCES `gameinfo` (`NAME`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_USERID2` FOREIGN KEY (`USERID`) REFERENCES `userset` (`USERID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of forum
-- ----------------------------
INSERT INTO `forum` VALUES ('0001', 'GRAND THEFT AUTO V', '00000001', 'Looking for Crews/Members/Players', 'This topic functions as a database for crew/player recruitment posts. If you\'re looking for a crew, members for your crew, or just a mate to play with, please leave a comment down below or choose one of the already existing entries.', '2017-11-13 12:35:07', 'N', 'N', 'Y');
INSERT INTO `forum` VALUES ('0001', 'GRAND THEFT AUTO V', '00000002', 'Can I Run It? Ask here.', '!!! ATTENTION !!!\r\nSeems like the \"Can I Run it\" spam is increasing; \"Can I Run it\" posts outside this thread may lead to locks, deletions and temporary bans.\r\n\r\nSeems like a popular topic, and since the Requirements have been released \"Can I run it threads\" can now be centralized here.\r\n\r\nSo use this thread to discuss your... system... and guess if it will make the cut.', '2017-11-13 12:35:24', 'N', 'N', 'Y');
INSERT INTO `forum` VALUES ('0001', 'GRAND THEFT AUTO V', '00000003', 'How to report cheaters/Hacked money - Read before posting.', '* Posting names, profiles, videos, images, etc. regarding cheaters on the Steam forums achieves absolutely nothing.\r\n\r\n* \"Name and Shame\" is not allowed.\r\n\r\n* Rockstar does not interact with these forums.\r\n\r\n* Valve is not involved with GTA V\'s development.', '2017-11-13 12:35:41', 'N', 'N', 'Y');
INSERT INTO `forum` VALUES ('0001', 'GRAND THEFT AUTO V', '00000004', 'Banned?', 'i did nothing wrong', '2017-11-13 12:37:58', 'N', 'N', 'N');
INSERT INTO `forum` VALUES ('0001', 'GRAND THEFT AUTO V', '00000005', 'Wait so people can give random people money? How can I avoid this?', 'I don\'t want a single penny from anyone. I want to earn everything on my own playing the game, not from hackers or whoever giving me millions. It would actually ruin the game for me and I would ask Rockstar if they can reset my money to whatever it was. So someone can pick a random dude in a game and give them money? If I join a crew would I have a good chance of recieving money from others? Like I said I want to earn every penny in this game.', '2017-11-13 12:38:40', 'N', 'N', 'N');
INSERT INTO `forum` VALUES ('0000', 'GRAND THEFT AUTO V', '00000021', 'hello ,monitor', 'hei', '2018-05-08 19:22:55', 'N', 'N', 'N');
INSERT INTO `forum` VALUES ('0029', 'GRAND THEFT AUTO V', '00000041', 'Steam Support', 'Wanna steam support', '2018-06-11 12:42:11', 'N', 'N', 'N');
INSERT INTO `forum` VALUES ('0029', 'GRAND THEFT AUTO V', '00000061', 'Hello , Steam', '123456789', '2018-06-20 20:20:09', 'N', 'Y', 'N');
INSERT INTO `forum` VALUES ('0001', 'GRAND THEFT AUTO V', '00000081', 'Can I Run It? Ask here.', '!!! ATTENTION !!!\r\nSeems like the \"Can I Run it\" spam is increasing; \"Can I Run it\" posts outside this thread may lead to locks, deletions and temporary bans.\r\n\r\nSeems like a popular topic, and since the Requirements have been released \"Can I run it threads\" can now be centralized here.\r\n\r\nSo use this thread to discuss your... system... and guess if it will make the cut.\r\n\r\n\"Can You Run It?\" System analyser.\r\n', '2019-04-21 19:15:49', 'N', 'Y', 'N');
INSERT INTO `forum` VALUES ('0001', 'GRAND THEFT AUTO V', '00000082', 'Can I Run It? Ask here.', '!!! ATTENTION !!!\r\nSeems like the \"Can I Run it\" spam is increasing; \"Can I Run it\" posts outside this thread may lead to locks, deletions and temporary bans.\r\n\r\nSeems like a popular topic, and since the Requirements have been released \"Can I run it threads\" can now be centralized here.\r\n\r\nSo use this thread to discuss your... system... and guess if it will make the cut.\r\n\r\n\"Can You Run It?\" System analyser.\r\n', '2019-04-21 19:28:30', 'N', 'Y', 'N');
INSERT INTO `forum` VALUES ('0001', 'GRAND THEFT AUTO V', '00000083', 'Can I Run It? Ask here.', '!!! ATTENTION !!!\r\nSeems like the \"Can I Run it\" spam is increasing; \"Can I Run it\" posts outside this thread may lead to locks, deletions and temporary bans.\r\n\r\nSeems like a popular topic, and since the Requirements have been released \"Can I run it threads\" can now be centralized here.\r\n\r\nSo use this thread to discuss your... system... and guess if it will make the cut.\r\n\r\n\"Can You Run It?\" System analyser.\r\n', '2019-04-21 19:28:51', 'N', 'Y', 'N');
INSERT INTO `forum` VALUES ('0001', 'GRAND THEFT AUTO V', '00000084', 'Question about \"cheating\"', 'I hear about a lot of people being banned for receiving modded money or equipment, randomly, without consent. Although im sure they\'re lying, is that even possible? or do you have to go out of your way to receive said items? And what would you do in that situation?\r\n', '2019-04-21 19:44:25', 'N', 'N', 'N');
INSERT INTO `forum` VALUES ('0001', 'GRAND THEFT AUTO V', '00000085', 'Just give us a map expansion already', 'Los santos is hella stale after 5 years', '2019-04-21 20:53:42', 'N', 'N', 'N');
INSERT INTO `forum` VALUES ('0001', 'GRAND THEFT AUTO V', '00000086', 'Social Club Stuck in Offline Mode!', 'I try and load GTA then Social Club pops up and says it\'s in Offline Mode and cant detect my internet.？\r\nIt worked to start with, but will not work now no matter what i try.', '2019-04-21 21:00:17', 'N', 'N', 'N');
INSERT INTO `forum` VALUES ('0002', 'GRAND THEFT AUTO V', '00000087', 'offline mode is not available', 'i just buy the game and it has this problem？\r\ni can play', '2019-04-21 21:01:39', 'N', 'N', 'Y');
INSERT INTO `forum` VALUES ('0001', 'GRAND THEFT AUTO V', '00000088', 'test1', 'test1', '2019-04-22 11:58:20', 'N', 'Y', 'N');
INSERT INTO `forum` VALUES ('591247827770802176', 'GRAND THEFT AUTO V', '591257525467217920', 'c', 'c', '2019-06-20 13:26:19', 'N', 'N', 'N');

-- ----------------------------
-- Table structure for forum_comment
-- ----------------------------
DROP TABLE IF EXISTS `forum_comment`;
CREATE TABLE `forum_comment`  (
  `ID` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `USERID` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CONTENT` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CDATE` datetime(0) NOT NULL,
  `LIKES` int(10) NOT NULL DEFAULT 0,
  `SEQ` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`SEQ`) USING BTREE,
  INDEX `FK_ID`(`ID`) USING BTREE,
  INDEX `FK_USERID3`(`USERID`) USING BTREE,
  CONSTRAINT `FK_ID` FOREIGN KEY (`ID`) REFERENCES `forum` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_USERID3` FOREIGN KEY (`USERID`) REFERENCES `userset` (`USERID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of forum_comment
-- ----------------------------
INSERT INTO `forum_comment` VALUES ('00000003', '0001', 'To keep the game play environment as fair as possible, we routinely do sweeps to separate cheaters from legitimate players. In addition to in-game automated detection, we also manually-review evidence submitted by the GTA Online community.', '2017-11-13 17:18:27', 12, '00000001');
INSERT INTO `forum_comment` VALUES ('00000003', '0002', 'If you see anyone in Grand Theft Auto Online using cheats, mods, or doing anything else suspicious, you can report them in several ways', '2017-11-13 17:19:00', 42, '00000002');
INSERT INTO `forum_comment` VALUES ('00000002', '0002', '(^_^)', '2017-11-13 17:19:16', 2, '00000003');
INSERT INTO `forum_comment` VALUES ('00000004', '0002', 'WRONG？', '2017-11-13 17:35:19', 2, '00000004');
INSERT INTO `forum_comment` VALUES ('00000005', '0029', '09877', '2017-11-14 14:00:23', 9, '00000024');
INSERT INTO `forum_comment` VALUES ('00000005', '0029', 'jljikklm', '2017-11-14 14:01:52', 4, '00000025');
INSERT INTO `forum_comment` VALUES ('00000041', '0029', 'help me ', '2018-06-11 12:42:53', 1, '00000044');
INSERT INTO `forum_comment` VALUES ('00000041', '0000', '?????', '2018-06-17 11:48:09', 1, '00000064');
INSERT INTO `forum_comment` VALUES ('00000003', '0001', 'fucking shit', '2018-09-10 17:17:57', 3, '00000084');
INSERT INTO `forum_comment` VALUES ('00000086', '0002', 'test', '2019-04-21 21:02:40', 0, '00000085');
INSERT INTO `forum_comment` VALUES ('00000086', '0002', 'I try and load GTA then Social Club pops up and says it\'s in Offline Mode and cant detect my internet.？\r\nIt worked to start with, but will not work now no matter what i try.\r\n', '2019-04-21 21:04:14', 4, '00000086');
INSERT INTO `forum_comment` VALUES ('00000086', '0002', 'So annoying!\r\n', '2019-04-21 21:08:32', 3, '00000087');
INSERT INTO `forum_comment` VALUES ('00000086', '0001', 'I\'ve got it working by Uninstalling the Latest Nvidia Drivers, and Reverting to my previous ones. Try it!\r\n', '2019-04-21 21:09:20', 0, '00000088');
INSERT INTO `forum_comment` VALUES ('00000086', '0001', 'After trying just about everything, short of formatting my computer, I tried this...？https://steamcommunity.com/app/271590/discussions/0/611703999965387677/\r\nand the game works fine for me now. Hope it helps.\r\n', '2019-04-21 21:09:39', 0, '00000089');
INSERT INTO `forum_comment` VALUES ('00000086', '0001', 'If your running on Steam then see if your steam needs an updead that helped me and if it with Rockstar Try to disconnect your internet and run offline if that dosnt work try and update as well\r\n', '2019-04-21 21:09:52', 0, '00000090');
INSERT INTO `forum_comment` VALUES ('00000086', '0001', 'fyi if your GTA V account is for online is Modded then you may have been Banned from your SC and will have to make a new account and buy gta v again so check your email to see if you have been banned.\r\n', '2019-04-21 21:10:01', 0, '00000091');
INSERT INTO `forum_comment` VALUES ('00000086', '0001', 'Try to connect smartphone with pc in modem mode. I just do it and its work.\r\n\r\nIyou not it was this simple and i dint know about it\r\n', '2019-04-21 21:10:11', 0, '00000092');
INSERT INTO `forum_comment` VALUES ('00000086', '0001', 'Mine has been doing this, hasn\'t worked once.\r\n', '2019-04-21 21:10:24', 0, '00000093');
INSERT INTO `forum_comment` VALUES ('00000086', '0001', 'Help', '2019-04-21 21:10:34', 0, '00000094');
INSERT INTO `forum_comment` VALUES ('00000086', '0001', '\"Can You Run It?\"', '2019-04-21 21:10:56', 0, '00000095');
INSERT INTO `forum_comment` VALUES ('00000061', '0001', 'hello', '2019-04-21 21:13:04', 0, '00000096');
INSERT INTO `forum_comment` VALUES ('00000088', '0001', 'hehe\r\n', '2019-04-22 11:58:29', 0, '00000097');
INSERT INTO `forum_comment` VALUES ('00000003', '0001', 'haha', '2019-04-26 15:30:56', 2, '00000098');
INSERT INTO `forum_comment` VALUES ('591257525467217920', '0001', 'laji', '2019-06-20 13:47:26', 11, '591262843014217728');
INSERT INTO `forum_comment` VALUES ('00000003', '0001', '???????????????', '2019-06-20 14:05:22', 7, '591267352776015872');

-- ----------------------------
-- Table structure for gameinfo
-- ----------------------------
DROP TABLE IF EXISTS `gameinfo`;
CREATE TABLE `gameinfo`  (
  `NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DEVELOPER` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PLATFORM` varchar(75) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `RELEASEDATE` datetime(0) NOT NULL,
  `INFO` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gameinfo
-- ----------------------------
INSERT INTO `gameinfo` VALUES ('GRAND THEFT AUTO', 'Rockstar North', 'PC,GameBoy Color,PSOne', '1998-05-01 00:00:00', 'Drive dozens of varied vehicles around three of America\'s toughest cities.\r\n\r\nOnly the best will be able to tame the fastest cars. Only the smartest will know all the short-cuts and the whereabouts of the hottest wheels.\r\n\r\nOnly the toughest will be able to take on the world and finish the job like a professional...');
INSERT INTO `gameinfo` VALUES ('GRAND THEFT AUTO 2', 'Rockstar North', 'PC,Sega Dreamcast,GameBoy Color,PSOne', '1999-10-27 00:00:00', 'Grand Theft Auto is back. The cars are faster. The streets are busier. The bad guys are nastier. The police are angrier. And now, the FBI and the Army are getting involved...\r\n\r\nSeven ruthless gangs are involved in a ruthless power struggle and it is up to you to make a name for yourself.\r\n\r\nRespect is earned, not given.');
INSERT INTO `gameinfo` VALUES ('GRAND THEFT AUTO ADVANCE', 'Digital Eclipse', 'GameBoy Advance', '2004-10-24 00:00:00', 'The legendary, rule-breaking and genre-defying Grand Theft Auto franchise has arrived on the Game Boy Advance.\r\n\r\nReturn to the streets of Liberty City in a brand new story, all new missions, and classic open-ended Grand Theft Auto gameplay.');
INSERT INTO `gameinfo` VALUES ('GRAND THEFT AUTO III', 'Rockstar North', 'PS4,PC,iOS,Mac,PS2,Android,Xbox,Kindle', '2001-10-22 00:00:00', 'Crime does pay.\r\n\r\nThe hugely successful, highly controversial Grand Theft Auto franchise moves into three dimensions in the dark and seedy underworld of Liberty City.\r\n\r\nWith the freedom to go anywhere and jack anyone, Grand Theft Auto 3 puts the dark, intriguing and ruthless world of crime at your fingertips, if you have enough guts to take it.');
INSERT INTO `gameinfo` VALUES ('GRAND THEFT AUTO IV', 'Rockstar Toronto, Rockstar North', 'PC, Xbox One, PS3, Xbox 360', '2008-04-28 00:00:00', 'What does the American Dream mean today?<br><br>For Niko Bellic, fresh off the boat from Europe, it is the hope he can escape his past.<br><br>For his cousin, Roman, it is the vision that together they can find fortune in Liberty City, gateway to the land of opportunity.<br><br>As they slip into debt and are dragged into a criminal underworld by a series of shysters, thieves and sociopaths, they discover that the reality is very different from the dream in a city that worships money and status, and is heaven for those who have them and a living nightmare for those who do not.');
INSERT INTO `gameinfo` VALUES ('GRAND THEFT AUTO V', 'Rockstar North', 'PC,PS4,Xbox One,PS3,Xbox 360', '2013-09-17 00:00:00', 'Los Santos: a sprawling sun-soaked metropolis full of self-help gurus, starlets and fading celebrities, once the envy of the Western world, now struggling to stay afloat in an era of economic uncertainty and cheap reality TV.<br><br>Amidst the turmoil, three very different criminals plot their own chances of survival and success: Franklin, a street hustler looking for real opportunities and serious money; Michael, a professional ex-con whose retirement is a lot less rosy than he hoped it would be; and Trevor, a violent maniac driven by the chance of a cheap high and the next big score. Running out of options, the crew risks everything in a series of daring and dangerous heists that could set them up for life.<br><br>The biggest, most dynamic and most diverse open world ever created, Grand Theft Auto V blends storytelling and gameplay in new ways as players repeatedly jump in and out of the lives of the game’s three lead characters, playing all sides of the game’s interwoven story.<br><br>All the classic hallmarks of the groundbreaking series return, including incredible attention to detail and Grand Theft Auto’s darkly humorous take on modern culture, alongside a brand new and ambitious approach to open world multiplayer.<br><br>Developed by series creators Rockstar North, Grand Theft Auto V is available worldwide for PC, PlayStation;4, PlayStation;3, Xbox One; and Xbox 360;.');
INSERT INTO `gameinfo` VALUES ('GRAND THEFT AUTO:CHINATOWN WARS', 'Rockstar Leeds,Rockstar North', 'iOS,Android,Kindle,PS,PNintendo DS', '2009-03-17 00:00:00', 'LEFT FOR DEAD IN THE WORST PLACE IN AMERICA\r\n\r\nFollowing his father\'s murder, Huang Lee has a simple mission: deliver an ancient sword to his Uncle Kenny to ensure his family retains control of the Triad gangs of Liberty City. Huang is a spoiled rich kid who expects everything to run smoothly, but his trip does not go exactly as planned. After being robbed and left to die, he will search for honor, riches and revenge in the most dangerous and morally bankrupt city in the world.');
INSERT INTO `gameinfo` VALUES ('GRAND THEFT AUTO:Episodes from Liberty City', 'Rockstar North', 'PC, Xbox One, PS3, Xbox 360', '2009-10-09 00:00:00', 'Grand Theft Auto: Episodes from Liberty City includes both The Lost and Damned and The Ballad of Gay Tony together on disc. <br><br>Grand Theft Auto: Episodes from Liberty City is now available worldwidefor Xbox 360;, PlayStation;3 and Games for Windows; - LIVE and does not require a copy of the original Grand Theft AutoIV to play.');
INSERT INTO `gameinfo` VALUES ('GRAND THEFT AUTO:LIBERTY CITY STORIES', 'Rockstar Leeds,Rockstar North', 'iOS,Android,PS2,Kindle,PSP', '2005-10-25 00:00:00', 'There are a million stories in Liberty City. This one changes everything. Once a trusted wise guy in the Leone crime family, Toni Cipriani was forced into hiding after killing a made man. Now he\'s back and it\'s time for things to be put right.\r\n\r\nThe streets of Liberty City are in turmoil. Warring mafiosi vie for control as the town begins to self-destruct under waves of political corruption, organized crime, drug trafficking and union strikes. No one can be trusted as Toni tries to clean up the mess of the city\'s chaotic underworld. Deranged hit men, morally depraved tycoons, cynical politicians and his own mother stand in his way as Toni tries to bring the city under Leone control.\r\n\r\nForced to fight for his life in an odyssey that will shake Liberty City to its foundations, Toni must use any means necessary to secure his place in the leadership of the Leone family in a town up for grabs.');
INSERT INTO `gameinfo` VALUES ('GRAND THEFT AUTO:LONDON 1969', 'Rockstar North', 'PC,PSOne', '1999-04-06 00:00:00', 'London can be yours, but as betrayal and brutality engulf your world, you\'ve got to keep a level head, keep earning the cash and keep driving a sleek ride. Or you\'ll have your head kicked in, and no mistake, sunshine.\r\n\r\nYou\'re playing with the big boys now, and we haven\'t had our dinner. So, my boy, only one question remains... do you want in? If so, get to bloody work. If not, go and play with your action figures, and stop wastin\' our time.\r\n\r\nAlright?');
INSERT INTO `gameinfo` VALUES ('GRAND THEFT AUTO:San Andreas', 'Rockstar North', 'PC, PS4, PS3, Xbox 360, Kindle, Mac, iOS, Windows Phone, Android, PS2, Xbox', '2004-10-26 00:00:00', 'Five years ago Carl Johnson escaped from the pressures of life in Los Santos, San Andreas... a city tearing itself apart with gang trouble, drugs and corruption. Where filmstars and millionaires do their best to avoid the dealers and gangbangers. <br><br>Now, it is the early 90s. Carl has got to go home. His mother has been murdered, his family has fallen apart and his childhood friends are all heading towards disaster. <br><br>On his return to the neighborhood, a couple of corrupt cops frame him for homicide. CJ is forced on a journey that takes him across the entire state of San Andreas, to save his family and to take control of the streets.');
INSERT INTO `gameinfo` VALUES ('GRAND THEFT AUTO:Vice City', 'Rockstar North', 'PC, PS4, Kindle, iOS, Mac, Android, PS2, Xbox', '2002-10-27 00:00:00', 'Welcome to the 1980s.<br><br>From the decade of big hair, excess and pastel suits comes a story of one man rise to the top of the criminal pile as Grand Theft Auto returns.<br><br>Vice City is a huge urban sprawl ranging from the beach to the swamps and the glitz to the ghetto, and is the most varied, complete and alive digital city ever created. Combining non-linear gameplay with a character driven narrative, you arrive in a town brimming with delights and degradation and are given the opportunity to take it over as you choose.');
INSERT INTO `gameinfo` VALUES ('GRAND THEFT AUTO:VICE CITY STORIES', 'Rockstar Leeds,Rockstar North', 'PS3,PS2,PSP', '2006-12-31 00:00:00', 'Vice City, 1984. Opportunity abounds in a city emerging from the swamps, its growth fueled by the violent power struggle in a lucrative drugs trade. Construction is everywhere as a shining metropolis rises from foundations of crime and betrayal.\r\n\r\nAs a soldier, Vic Vance has always protected his dysfunctional family, his country, himself. One bad decision later and that job is about to get much harder. Kicked out onto the streets of a city torn between glamour and gluttony, Vic is faced with a stark choice - build an empire or be crushed.');

-- ----------------------------
-- Table structure for nav
-- ----------------------------
DROP TABLE IF EXISTS `nav`;
CREATE TABLE `nav`  (
  `NAVID` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `NAVNAME` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `INFO` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`NAVID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of nav
-- ----------------------------
INSERT INTO `nav` VALUES ('0001', 'user', '用户信息');
INSERT INTO `nav` VALUES ('0002', 'role', '角色信息');
INSERT INTO `nav` VALUES ('0003', 'game', '游戏信息');
INSERT INTO `nav` VALUES ('0004', 'video', '视频信息');
INSERT INTO `nav` VALUES ('0005', 'CSS', '样式信息');
INSERT INTO `nav` VALUES ('0006', 'news', '新闻信息');
INSERT INTO `nav` VALUES ('0007', 'right', '授权信息');
INSERT INTO `nav` VALUES ('0008', 'Assign permissions', '权限分配');
INSERT INTO `nav` VALUES ('0028', 'forum', '论坛信息');

-- ----------------------------
-- Table structure for navrole
-- ----------------------------
DROP TABLE IF EXISTS `navrole`;
CREATE TABLE `navrole`  (
  `ROLEID` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `NAVID` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  INDEX `UNIQUE_ROLEID`(`ROLEID`) USING BTREE,
  INDEX `UNIQUE_NAVID`(`NAVID`) USING BTREE,
  CONSTRAINT `UNIQUE_NAVID` FOREIGN KEY (`NAVID`) REFERENCES `nav` (`NAVID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `UNIQUE_ROLEID` FOREIGN KEY (`ROLEID`) REFERENCES `role` (`ROLEID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of navrole
-- ----------------------------
INSERT INTO `navrole` VALUES ('0004', '0028');
INSERT INTO `navrole` VALUES ('0003', '0003');
INSERT INTO `navrole` VALUES ('0003', '0004');
INSERT INTO `navrole` VALUES ('0006', '0002');
INSERT INTO `navrole` VALUES ('0007', '0001');
INSERT INTO `navrole` VALUES ('0005', '0008');
INSERT INTO `navrole` VALUES ('0002', '0003');
INSERT INTO `navrole` VALUES ('0002', '0004');
INSERT INTO `navrole` VALUES ('0002', '0005');
INSERT INTO `navrole` VALUES ('0002', '0006');
INSERT INTO `navrole` VALUES ('0002', '0007');
INSERT INTO `navrole` VALUES ('0002', '0008');
INSERT INTO `navrole` VALUES ('0002', '0001');
INSERT INTO `navrole` VALUES ('0002', '0028');
INSERT INTO `navrole` VALUES ('0002', '0002');
INSERT INTO `navrole` VALUES ('0001', '0001');
INSERT INTO `navrole` VALUES ('0001', '0004');

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news`  (
  `USERID` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ID` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CREATE_DATE` datetime(0) NULL DEFAULT NULL,
  `UPLOAD_DATE` datetime(0) NULL DEFAULT NULL,
  `LIKES` int(10) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES ('0001', '06dd5551d07409dc2bcc2ce532f35686', '2019-04-27 15:41:00', '2019-04-27 15:43:15', 0);
INSERT INTO `news` VALUES ('0001', '0ca36e22cec111337943e4fd0538cb51', '2019-04-27 15:49:00', '2019-04-27 15:50:58', 0);
INSERT INTO `news` VALUES ('0001', 'cc01d3fa3b90ffee36f6d52bf2bf73e5', '2019-04-27 15:23:00', '2019-04-27 15:27:11', 0);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `ROLEID` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ROLENAME` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `INFO` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`ROLEID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('0001', 'user', '普通用户');
INSERT INTO `role` VALUES ('0002', 'admin', '超级管理员');
INSERT INTO `role` VALUES ('0003', 'game admin', '游戏管理员');
INSERT INTO `role` VALUES ('0004', 'forum', '论坛管理员');
INSERT INTO `role` VALUES ('0005', 'Permission', '权限管理员');
INSERT INTO `role` VALUES ('0006', 'role admin', '角色管理员');
INSERT INTO `role` VALUES ('0007', 'user admin', '用户管理员');

-- ----------------------------
-- Table structure for sensitive_word
-- ----------------------------
DROP TABLE IF EXISTS `sensitive_word`;
CREATE TABLE `sensitive_word`  (
  `INFO` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sensitive_word
-- ----------------------------
INSERT INTO `sensitive_word` VALUES ('傻逼');
INSERT INTO `sensitive_word` VALUES ('bitch');

-- ----------------------------
-- Table structure for userset
-- ----------------------------
DROP TABLE IF EXISTS `userset`;
CREATE TABLE `userset`  (
  `USERID` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `PASSWORD` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `EMAIL` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `PHONE` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `USERNAME` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `SIGNDATE` datetime(0) NOT NULL,
  `LASTSIGN` datetime(0) NULL DEFAULT NULL,
  `ISLOCKED` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `ISDELETE` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `ROLEID` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0001',
  PRIMARY KEY (`USERID`) USING BTREE,
  UNIQUE INDEX `UNIQUE_EMAIL`(`EMAIL`) USING BTREE,
  UNIQUE INDEX `UNIQUE_PHONE`(`PHONE`) USING BTREE,
  UNIQUE INDEX `UNIQUE_USERNAME`(`USERNAME`) USING BTREE,
  INDEX `FK_ROLEID`(`ROLEID`) USING BTREE,
  CONSTRAINT `FK_ROLEID` FOREIGN KEY (`ROLEID`) REFERENCES `role` (`ROLEID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of userset
-- ----------------------------
INSERT INTO `userset` VALUES ('0000', '797959d633124b57e92f6953a4d8b411', 'rockstar@126.com', '13800000000', 'system', '2016-01-01 00:00:00', '2019-06-20 10:28:07', 'N', 'N', '0002');
INSERT INTO `userset` VALUES ('0001', '68e141daa6862cb8e04361b97a9321ca', 'q1053893799@126.com', '13842026644', 'LegendaryPC', '2016-01-01 00:00:00', '2019-06-20 14:27:49', 'N', 'N', '0002');
INSERT INTO `userset` VALUES ('0002', '797959d633124b57e92f6953a4d8b411', 'pikaqiu@126.com', '13834080818', 'chaiji', '2016-01-01 00:00:00', '2019-04-25 16:07:30', 'N', 'N', '0001');
INSERT INTO `userset` VALUES ('0003', '797959d633124b57e92f6953a4d8b411', 'pikaqiuguonima@126.com', '13633481091', 'bobobird', '2016-01-01 00:00:00', '2017-11-16 15:24:28', 'N', 'N', '0004');
INSERT INTO `userset` VALUES ('0004', '797959d633124b57e92f6953a4d8b411', 'Q1053893799@qq.com', '15103543766', 'boboniao', '2016-01-01 00:00:00', '2017-04-23 00:00:00', 'N', 'N', '0001');
INSERT INTO `userset` VALUES ('0005', '797959d633124b57e92f6953a4d8b411', 'q1053893799@163.com', '18635301396', 'father', '2016-01-01 00:00:00', '2017-04-23 00:00:00', 'N', 'N', '0001');
INSERT INTO `userset` VALUES ('0006', '797959d633124b57e92f6953a4d8b411', 'qchaiji@126.com', '18522131451', 'chaijiba', '2016-01-01 00:00:00', NULL, 'N', 'N', '0001');
INSERT INTO `userset` VALUES ('0007', '797959d633124b57e92f6953a4d8b411', 'q13215@126.com', '13834080819', 'hehedapc', '2016-01-01 00:00:00', '2017-12-15 22:30:20', 'N', 'N', '0001');
INSERT INTO `userset` VALUES ('0008', '797959d633124b57e92f6953a4d8b411', 'pan@126.com', '13812341234', 'pan', '2016-01-01 00:00:00', '2017-10-14 00:00:00', 'N', 'N', '0001');
INSERT INTO `userset` VALUES ('0009', '797959d633124b57e92f6953a4d8b411', 'A111332@qq.com', '13245654311', 'LiHengXing', '2016-01-01 00:00:00', '2017-11-06 14:05:30', 'N', 'N', '0001');
INSERT INTO `userset` VALUES ('0010', '797959d633124b57e92f6953a4d8b411', 'q1@126.com', '13112312312', '123ewew', '2016-01-01 00:00:00', '2017-11-06 10:26:56', 'N', 'N', '0001');
INSERT INTO `userset` VALUES ('0011', '797959d633124b57e92f6953a4d8b411', 'q123455@126.com', '13112121213', 'guojs', '2016-01-01 00:00:00', '2017-11-06 16:18:08', 'N', 'N', '0001');
INSERT INTO `userset` VALUES ('0029', '797959d633124b57e92f6953a4d8b411', 'q1564645646565@126.com', '13814141414', 'guobs', '2016-01-01 00:00:00', '2018-06-20 20:18:15', 'Y', 'Y', '0003');
INSERT INTO `userset` VALUES ('591247827770802176', 'e10adc3949ba59abbe56e057f20f883e', 'q12@126.com', '13814783692', 'testtest', '2019-06-20 12:47:47', '2019-06-20 12:47:47', 'N', 'N', '0001');

-- ----------------------------
-- Table structure for video
-- ----------------------------
DROP TABLE IF EXISTS `video`;
CREATE TABLE `video`  (
  `NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ID` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `VIDEO_NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `VIEW_TIME` int(10) NOT NULL DEFAULT 0,
  `UPDATE_DATE` datetime(0) NOT NULL,
  `USERID` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE INDEX `UK_VIDEO_NAME`(`VIDEO_NAME`) USING BTREE,
  INDEX `FK_NAME1`(`NAME`) USING BTREE,
  INDEX `FK_USERID`(`USERID`) USING BTREE,
  CONSTRAINT `FK_NAME1` FOREIGN KEY (`NAME`) REFERENCES `gameinfo` (`NAME`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_USERID` FOREIGN KEY (`USERID`) REFERENCES `userset` (`USERID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of video
-- ----------------------------
INSERT INTO `video` VALUES ('GRAND THEFT AUTO V', '00000001', 'GTA5 preview_1', 44, '2012-01-10 00:00:00', '0001');
INSERT INTO `video` VALUES ('GRAND THEFT AUTO IV', '00000004', 'GTA4 preview_3', 28, '2008-01-01 00:00:00', '0001');
INSERT INTO `video` VALUES ('GRAND THEFT AUTO:Episodes from Liberty City', '00000005', 'GTA LC', 9, '2017-07-01 00:00:00', '0001');
INSERT INTO `video` VALUES ('GRAND THEFT AUTO V', '00000006', 'V_transform_racers', 27, '2017-10-28 00:00:00', '0001');
INSERT INTO `video` VALUES ('GRAND THEFT AUTO V', '00000008', 'V_smugglers_run_trailer', 11, '2018-06-17 15:00:45', '0000');
INSERT INTO `video` VALUES ('GRAND THEFT AUTO:CHINATOWN WARS', '00000014', 'chinatownwars-revenge', 5, '2018-06-17 15:28:31', '0000');
INSERT INTO `video` VALUES ('GRAND THEFT AUTO:San Andreas', '00000015', 'sanandreas-mobiletrailer', 2, '2018-06-17 15:40:48', '0000');
INSERT INTO `video` VALUES ('GRAND THEFT AUTO:Vice City', '00000016', 'vicecity-10yranniversarymobilevc', 2, '2018-06-17 15:42:38', '0000');
INSERT INTO `video` VALUES ('GRAND THEFT AUTO V', '00000027', 'V-afterhours', 4, '2018-09-09 20:51:15', '0000');
INSERT INTO `video` VALUES ('GRAND THEFT AUTO V', '00000028', 'V_heists', 27, '2019-04-25 15:44:46', '0002');
INSERT INTO `video` VALUES ('GRAND THEFT AUTO IV', '00000033', 'GTA4 preview_1', 0, '2019-04-26 14:40:32', '0001');
INSERT INTO `video` VALUES ('GRAND THEFT AUTO IV', '00000034', 'GTA4 preview_2', 0, '2019-04-26 14:41:00', '0001');

-- ----------------------------
-- Table structure for video_comment
-- ----------------------------
DROP TABLE IF EXISTS `video_comment`;
CREATE TABLE `video_comment`  (
  `ID` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `USERID` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CONTENT` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CDATE` datetime(0) NOT NULL,
  `LIKES` int(10) NOT NULL DEFAULT 0,
  `SEQ` char(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`SEQ`) USING BTREE,
  INDEX `FK_ID1`(`ID`) USING BTREE,
  INDEX `FK_USERID1`(`USERID`) USING BTREE,
  CONSTRAINT `FK_ID1` FOREIGN KEY (`ID`) REFERENCES `video` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_USERID1` FOREIGN KEY (`USERID`) REFERENCES `userset` (`USERID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of video_comment
-- ----------------------------
INSERT INTO `video_comment` VALUES ('00000006', '0001', 'GTA OL race!', '2017-11-06 21:50:26', 4, '00000001');
INSERT INTO `video_comment` VALUES ('00000001', '0001', 'GTA5 preview1!!!!!', '2017-11-06 21:54:14', 2, '00000002');
INSERT INTO `video_comment` VALUES ('00000006', '0002', 'Interesting', '2017-11-10 11:19:57', 3, '00000003');
INSERT INTO `video_comment` VALUES ('00000004', '0002', 'what???????', '2017-12-15 21:17:23', 2, '00000004');
INSERT INTO `video_comment` VALUES ('00000006', '0002', '20 views only?', '2017-12-15 23:23:46', 1, '00000005');
INSERT INTO `video_comment` VALUES ('00000006', '0001', '30.', '2018-01-17 19:48:38', 2, '00000024');
INSERT INTO `video_comment` VALUES ('00000015', '0001', 'what the fucking shit?mother fucker?', '2018-06-19 22:38:43', 4, '00000064');
INSERT INTO `video_comment` VALUES ('00000008', '0001', 'what ?', '2018-06-20 19:59:17', 3, '00000065');
INSERT INTO `video_comment` VALUES ('00000028', '0001', 'lalala', '2019-04-25 16:19:32', 12, '00000084');
INSERT INTO `video_comment` VALUES ('00000028', '591247827770802176', 'hahaha', '2019-06-20 12:56:05', 26, '591249916878127104');

SET FOREIGN_KEY_CHECKS = 1;
