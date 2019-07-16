SET NAMES UTF8;
DROP DATABASE IF EXISTS cp;
CREATE DATABASE cp CHARSET=UTF8;
USE cp;



/*推荐页三餐推荐*/
CREATE TABLE cp_tj_sancan( 
  sid INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(32),
  benefit VARCHAR(32), #好处
  type VARCHAR(8),
  pic VARCHAR(128)
);
INSERT INTO cp_tj_sancan VALUES
(NULL,"嫩滑鸡蛋糕","补充蛋白质，提高免疫力","早餐","http://127.0.0.1:9999/tj_sancan/394c75088907de693fba10b7bedbc8cd.jpg"),
(NULL,"火腿肠鸡蛋饼","提供多种氨基酸，增强体质","早餐","http://127.0.0.1:9999/tj_sancan/242e652d1c23bf20cb99324a6f612116.jpg"),
(NULL,"可乐鸡翅尖","高蛋白低脂肪，好吃不胖","午餐","http://127.0.0.1:9999/tj_sancan/b6a425f536be189fe119e98fe196c85b.jpg"),
(NULL,"豆腐皮素菜卷","健康少油，补充维生素","午餐","http://127.0.0.1:9999/tj_sancan/c2dc1db3c96007406416c5af7e58312c.jpg"),
(NULL,"美味松饼","富含碳水化合物，提供能量","下午茶","http://127.0.0.1:9999/tj_sancan/1ff8b02bb6729bbac8627212480b82ba.jpg"),
(NULL,"香肠芝士吐司卷","补充蛋白质，增强体质","下午茶","http://127.0.0.1:9999/tj_sancan/faae44219ddac422228ef5cb2cc60179.jpg"),
(NULL,"凉拌腐竹","含钙量高，促进生长发育","晚餐","http://127.0.0.1:9999/tj_sancan/90cc20606daa58f3c44501fafbfff133.jpg"),
(NULL,"三鲜饺子","富含维生素，增进食欲","晚餐","http://127.0.0.1:9999/tj_sancan/f0d866209cf4668308c0404e40e3fa73.jpg"),
(NULL,"酸辣粉","富含膳食纤维，多吃减肥","夜宵","http://127.0.0.1:9999/tj_sancan/7ed07b2d470630fadf1f1bb7ed027697.jpg"),
(NULL,"自制红油辣子","富含维C，增进食欲","夜宵","http://127.0.0.1:9999/tj_sancan/125454d0ba92403e7f34bb5025284d9b.jpg");


/**用户信息**/
CREATE TABLE cp_user(
  uid INT PRIMARY KEY AUTO_INCREMENT,
  uname VARCHAR(32),
  upwd VARCHAR(32),
  phone BIGINT,
  email VARCHAR(256),
  avatar VARCHAR(128)
);
INSERT INTO cp_user VALUES
(NULL,"美食小编","123456",13579246810,"13579246810@qq.com","http://127.0.0.1:9999/user_avatar/20120902160411_ik2UH.jpg"),
(NULL,"唐莎","123456",15324652145,"tangsha@qq.com","http://127.0.0.1:9999/user_avatar/fc86fbe322952f4babdb29857b36fc8.png"),
(NULL,"小珍","123456",15348235468,"xiaozhen@qq.com","http://127.0.0.1:9999/user_avatar/u=527690908,841994411&fm=26&gp=0.jpg"),
(NULL,"宗良","123456",13478549543,"zongliang@qq.com","http://127.0.0.1:9999/user_avatar/u=1471800268,3373504429&fm=26&gp=0.jpg"),
(NULL,"靓仔","123456",13729412134,"liangzai@qq.com","http://127.0.0.1:9999/user_avatar/u=2136146216,1955357192&fm=26&gp=0.jpg");


/*菜谱详情*/
CREATE TABLE cp_details(  
  did INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(32),
  benefit VARCHAR(128), #益处
  user_id SMALLINT, #用户的id
  score INT, #评分
  primary_cl VARCHAR(128), #主料
  secondary_cl VARCHAR(128), #辅料
  type_id VARCHAR(32), #菜谱类型
  pic VARCHAR(128), #图片路径
  user_log VARCHAR(1024), #用户日志
  browse BIGINT, #浏览量
  shoucang BIGINT #收藏次数
);
INSERT INTO cp_details VALUES
(1,"嫩滑鸡蛋糕","健脑益智 保肝 动脉硬化 防癌 延年益寿 美容护肤",1,3,"鸡蛋2个、纯净水适量","盐1小勺、料酒1勺、生抽1勺、香醋1勺、香油适量、枸杞子适量",8,"http://127.0.0.1:9999/cp_details_img/s6030800_156172755562147.jpg","早上不知道吃啥，就蒸一碗香浓嫩滑的鸡蛋糕吧！嫩嫩的，滑滑的，非常好吃，一勺入口，顺喉而下，香嫩爽滑，入口即化。",0,0),
(2,"虾仁火腿肠鸡蛋饼","健脑益智 保肝 动脉硬化 防癌 延年益寿 美容护肤",1,4,"鸡蛋3个、火腿肠1/2根、虾仁15个、面粉60克","盐1匙、小葱3根、植物油1/2勺",8,"http://127.0.0.1:9999/cp_details_img/s3324407_156221667900504.jpg","。",0,0),
(3,"可乐鸡翅尖","消食开胃 防癌 健脑 散瘀止痛 排毒",3,4,"翅尖250克、可乐250克、生抽10克、蚝油5克、料酒10克、食用油10克","装饰用生菜叶3片、熟白芝麻适量",9,"http://127.0.0.1:9999/cp_details_img/s5469155_154039285277235.jpg","这次买的是鸡翅尖，价钱比鸡中翅便宜一半；可乐也买的大瓶装，2L一瓶才6块钱左右，以前都买的易拉罐包装的，一罐330ml都要4块钱...",0,0),
(4,"豆腐皮素菜卷","缓解更年期 防乳腺癌 肝火 防癌 贫血 降糖 助消化 去火 清肺化痰",4,4,"豆腐皮2张、芹菜1棵、胡萝卜1根、小葱2棵","芝麻油少许、盐少许、甜面酱适量",9,"http://127.0.0.1:9999/cp_details_img/s2811207_156262472069189.jpg","豆腐皮，也有地方叫千张，是黄豆磨成豆浆后压制而成的。具体的做法咱不知，如果知道了咱也开豆腐坊去了。咱们只管吃就是啦！豆腐...",0,0),
(5,"荷兰松饼","健脑益智 保肝 动脉硬化 防癌 延年益寿 美容护肤 美容养颜 益智",3,3,"鸡蛋2个、牛奶150克、精盐2克、香草精2滴、糖20克、中筋面粉40克、黄油15克","糖粉适量、水果适量",10,"http://127.0.0.1:9999/cp_details_img/s13640200_156258557966129.jpg","每个周一都懒洋洋啊
想着爬起来跑步‍
但是怎么都爬不起来～
有没有宝宝有不赖床的方法呀
我的……大概是吃？
但是动力还是不够...",0,0),
(6,"香肠芝士土司卷","消食开胃 润肠通便",2,3,"土司面包100克、香肠100克、奶酪50克","鸡蛋50克、面包糠50克",10,"http://127.0.0.1:9999/cp_details_img/s3542197_156237341143125.jpg","快手版早餐，一只咬下去奶香味的芝士溢出来，好吃",0,0),
(7,"凉拌腐竹花生米","防癌 抗衰老 中毒 糖尿病 减肥 健脑",1,3,"腐竹一把、黄瓜一根、花生米一小碗","生抽一勺、香醋一勺、凉拌汁半勺、辣椒油两勺、盐适量、小米辣六个、生姜大蒜沫5克",11,"http://127.0.0.1:9999/cp_details_img/s6482563_156247244322259.jpg","持续了一段时间的高温这几天每天都下雨 整个空气都是湿嗒嗒的 人很不舒服，每年梅雨季节感觉身体都好沉，湿气太重 食欲也是时好...",0,0),
(8,"海兔木耳韭菜鸡蛋饺子","消食开胃 降压 散瘀止痛 健脑益智 保肝 动脉硬化 防癌 延年益寿 美容护肤 保护肝脏 润肠通便 排毒 减肥瘦身 促消化 健胃 慢性肝炎",3,4,"海兔25个、花椒粉1克、猪油10克、中筋面粉200克、菠菜粉2克、料酒2克、鸡蛋2枚、韭菜150克、木耳(水发)10朵、花生油10克、鸡精0.5克、姜2片、小葱5克、香菜1颗","盐适量",11,"http://127.0.0.1:9999/cp_details_img/s6108197_156189893813567.jpg","我和家人最爱吃的就是饺子，刚好家里还剩下点韭菜，搭配上海兔和鸡蛋，再加上排毒的木耳，用菠菜粉和的面皮，清新又好吃，虽然是...",0,0),
(9,"酸辣粉","点击查看酸辣粉原创视频 清热解暑",5,4,"红薯粉一把、花生米适量、湘菜几根","油适量、盐适量、陈醋一勺、生抽适量、辣椒油适量、小尖椒几个、姜蒜末适量",12,"http://127.0.0.1:9999/cp_details_img/s1025708_156144988634100.jpg","夏至过后，天气是一天比一天热了，这段时间大人孩子都没食欲，吃什么都提不起兴趣。平常孩子爱吃的基围虾呀、清蒸鱼呀，似乎都吸...",0,0),
(10,"自制红油辣子","",2,3,"二荆条150克适量、朝天椒150克适量、 小米辣150克 适量","葱姜适量适量、八角桂皮香叶适量适量、花椒茴香草果适量适量、白芝麻适量适量",12,"http://127.0.0.1:9999/cp_details_img/s30010_154796195174821.jpg","小小一勺辣椒油能将任何食物化平淡为惊奇，瞬间引爆你的食欲，让你胃口大开，对于无辣不欢的人来说，一碗好的辣椒油可是食物界的...",0,0),
(11,"鸡蛋炒虾仁","健脑益智 保肝 动脉硬化 防癌 延年益寿 美容护肤 保护肝脏 润肠通便",2,4,"虾仁200克、鸡蛋2个、韭菜2棵","食盐1小勺、料酒1小勺、植物油1大勺、生粉1勺",1,"http://127.0.0.1:9999/cp_details_img/s1655935_89415.jpg","炎热的季节，相信甜脆鲜美的大虾一定更让人青睐，一盘鸡蛋炒虾仁，有鸡蛋和韭菜的香，又有虾仁的甜脆鲜美，再来一道汤，基本一顿...",0,0),
(12,"爆炒螺蛳","去火",1,5,"螺蛳500克","红辣椒1个、姜5片、葱花儿少许、糖1小勺、料酒1大勺、盐1小勺",1,"http://127.0.0.1:9999/cp_details_img/s4089996_143178207466519.jpg","生活在南方的我，很喜欢吃螺蛳，不用手辅助，用筷子一夹就能把肉吸出来，顺便把内脏留在壳里。这个东西味道鲜美，吃一大碗也不会...",0,0),
(13,"芦笋炒蛋","健脑益智 保肝 动脉硬化 防癌 延年益寿 美容护肤 清热利尿 健脑",2,4,"鸡蛋2个、芦笋150克","培根1片、盐适量、食用油适量",1,"http://127.0.0.1:9999/cp_details_img/s4021908_143529057871555.jpg","芦笋的吃法有很多种，用来炒蛋也是很经典的。我有个习惯，买回家的芦笋，直接分两部分，根部去皮做炒菜，稍部白灼或者做浓汤或者...",0,0),
(14,"爆炒肥肠","排毒 清热去火 散瘀止疼 防癌抗癌 减肥 散瘀止痛 消食 开胃消食",2,3,"猪大肠300g、辣椒(红，尖，干)100g","植物油20g、食盐3g、生抽一小勺、老抽一小勺",1,"http://127.0.0.1:9999/cp_details_img/s3822242_142754460741166.jpg","发的都是口水留一地的菜啊！",0,0),
(15,"东坡肉","去火 清肺化痰 防癌 预防感冒 散瘀止疼 治肠炎 开胃 预防中暑 美容养颜",1,5,"五花肉200克、小葱适量、姜适量、水80毫升","食用油5毫升、白砂糖15克、盐3克、老抽3克、生抽20克、料酒5克",2,"http://127.0.0.1:9999/cp_details_img/s113291_154045509370624.jpg","吃腻了红烧肉的就试试东坡肉吧",0,0),
(16,"快手下饭菜—酸菜粉儿","助消化 消食 开胃消食 感冒 祛除寒气 消食开胃 防癌",3,3,"素肉20克、酸菜250克、粉丝50克、干辣椒9个、香菜10克、酱油1大勺","盐适量",2,"http://127.0.0.1:9999/cp_details_img/s2269628_144659462196404.jpg","酸菜粉儿原本就是我家超爱的一道下饭菜，
味道酸辣鲜香，
配白米饭最好不过了。
自从爱上素食后，
每周有一天三餐必是素滴。
我...",0,0),
(17,"田园麻辣虾锅","下奶 动脉硬化",3,3,"对虾600克","熟玉米1个、土豆2个、有机花菜200克、洋葱半个、生姜1小块、八角1个、桂皮1小块、香叶2片、干红辣椒6个、花椒20粒、郫县豆瓣酱1大勺",2,"http://127.0.0.1:9999/cp_details_img/s4021908_143945562245477.jpg","儿子放暑假，变着花样给儿子做法，有热情有干劲。",0,0),
(18,"肉末虎皮青椒","清热去火 散瘀止疼 心血管病 消食 助消化 补肾",3,4,"柿子椒4个、猪肉(瘦)100克","小葱1根、生姜1小块、酱油8克、白糖少许、盐适量、食用油适量、食醋少许、淀粉适量",2,"http://127.0.0.1:9999/cp_details_img/s4021908_144446529825949.jpg","青椒搁了好几天也没有做，今天终于做出来了。上桌的时候，我妈跟我妞儿说，哟，好些天我都想吃这个菜，没有跟你妈说，今儿可做出...",0,0),
(19,"清炒四季时蔬","抗衰老 减肥瘦身 防癌 清热利尿 健脑 降糖 助消化 排毒",4,3,"紫甘蓝100克、藕片50克、芦笋50克、胡萝卜30克、木耳(水发)30g","食盐适量、食用油适量、葱花5克",3,"http://127.0.0.1:9999/cp_details_img/s271944_145558547217743.jpg","每逢佳节胖三斤。胖了三斤又三斤。这春节小长假刚结束，马上又要开始正月十五闹元宵了。大鱼大肉一波一波的吃了又吃。特别需要来...",0,0),
(20,"春季时蔬杂素汤","美容 减肥 排毒 降糖 降血脂 补血 防癌 化痰 健脾 降血糖 降压 滋养肾气 润肤美容 预防中暑 助消化 去火",5,3,"冬瓜400克、草菇250克","海茸30克、春笋200克、薏米50克",3,"http://127.0.0.1:9999/cp_details_img/c59815c5787e583bdcf1096d4726e794.jpg","@1@海茸蕊、薏米用清水泡发半小时@2@冬瓜去皮切正方块，然后切十字刀花@3@海茸蕊、薏米洗净沥干水份@4@竹笋去皮切段，草菇洗净切...",0,0),
(21,"四季时蔬西兰花","防癌 瘦身减肥 清热解渴 抗衰老 降糖 助消化",5,2,"西兰花150克、胡萝卜半根","金针菇100克、蚝油2茶匙、生抽2茶匙、水淀粉50克",3,"http://127.0.0.1:9999/cp_details_img/s9925432_151555667159230.jpg","大鱼大肉吃腻了总需要吃点清淡的调节一下～西兰花和胡萝卜的营养价值很高，对于久坐办公室的上班族来说，有护眼、排毒、刮油的功...",0,0),
(22,"素萝卜丝丸子","消食 降糖 助消化",4,3,"白萝卜500克、胡萝卜200克","米饭适量、面粉适量、鸡蛋1个、葱姜、胡椒粉适量",4,"http://127.0.0.1:9999/cp_details_img/s1102105_142709436390727.jpg","萝卜营养丰富，有很好的食用、医疗价值。“冬吃萝卜夏吃姜，一年四季保安康”的说法。萝卜中的B族维生素和钾、镁等矿物质可促进...",0,0),
(23,"自制美味素鸡","心血管疾",4,3,"千张9张","酱油2大勺、白糖1小勺、小苏打1/2小勺",4,"http://127.0.0.1:9999/cp_details_img/s1537765_144446837623248.jpg","一般做菜都是去买成品素鸡，其实自己制作素鸡也是很简单的，我每次都会多做一些放在冰箱冷冻储存，吃之前自然解冻后就可以凉拌、...",0,0),
(24,"素食香蕉小蛋糕","",4,3,"低筋面粉120克、雪健全麦营养粉20克","咖啡粉4克、豆浆粉3克、水20克、香蕉200克、椰蓉20克、杏仁少许、香蕉片少许、杏仁粉20克、鸡蛋2个、色拉油40克、白砂糖60克",4,"http://127.0.0.1:9999/cp_details_img/s2277342_05337.jpg","这个香蕉小蛋糕，不含黄油和牛奶，可以说是偏素的蛋糕。偏素的东西我眼里一直都是口感欠佳的，但这个小蛋糕的味道却让我惊喜。内...",0,0),
(25,"肉食动物的“速食面”","防癌 延缓衰老 散瘀止疼 止咳化痰 通便排毒",2,3,"肥牛卷200克、青蒜若干、粉丝若干、番茄若干、红椒若干、蘑菇若干","黄豆酱若干、韩式辣酱若干、酱油心生若干、小鲜侶若干",5,"http://127.0.0.1:9999/cp_details_img/s5472261_149964776033043.jpg","其实我并不是一个无肉不欢的人，
但是奇怪的是，
非素食主义的人，是不是都和我一样，
即使不会对肉本身狂热的迷恋，
但是对带有...",0,0),
(27,"肉食懒人的福利—酱烤鸡腿肉","养肾 防癌 预防感冒 散瘀止疼 治肠炎 开胃 预防中暑",3,3,"鸡腿3个、大葱30克、姜20克","生抽酱油20克、豆瓣酱15克、蜂蜜水（15g蜂蜜+5g水）20克、蜂蜜15克、黑胡椒粉适量",5,"http://127.0.0.1:9999/cp_details_img/s8978638_149506240495837.jpg","甜食让人愉悦，肉食给人满足，尤其对我这种无肉不欢的人来说，一天没有肉吃，总觉得不甚圆满。岳母的饮食习惯偏素，平日里做饭炒...",0,0),
(28,"肉食主义--韩式烤牛肉三明治","",2,2,"牛肉适量、吐司4片","洋葱半个、韭菜适量、胡萝卜（小）半根、蒜4瓣、香菇5个、烤肉料适量",5,"http://127.0.0.1:9999/cp_details_img/s4031042_146561597506698.jpg","厌倦了常规三明治，早晨锻炼后来点牛肉补充一下也是不错的。烤肉、早餐，so eaey!come on!",0,0),
(29,"冬瓜汤","减肥瘦身 滋养肾气 化痰 防癌 润肤美容 降血糖 降血脂 助减肥 降压",1,5,"冬瓜400克、高汤1000毫升","香菜10克、盐2克、花椒1克、枸杞3克",6,"http://127.0.0.1:9999/cp_details_img/s113291_154086898324303.jpg","无",0,0),
(30,"醪糟汤圆","",3,4,"元宵200克、醪糟100克","枸杞5克、桂花1克、白砂糖5克",6,"http://127.0.0.1:9999/cp_details_img/s113291_154769166741376.jpg","无",0,0),
(31,"香菇鸡汤面","",2,3,"鸡汤1碗、宽粉300克","水半锅、香菇炒肉1份",6,"http://127.0.0.1:9999/cp_details_img/s1025708_146252107459174.jpg","简简单单的面条，有了鸡汤的打底，不但更美味，营养也更丰富呢。因为有剩菜，顺便就码放在上面当配菜，很随意的搭配，却是很美味...",0,0),
(32,"疙瘩汤","点击查看疙瘩汤原创视频  防癌 高血压 消食 延年益寿 美容养颜 健脑益智 保肝 动脉硬化 美容护肤",1,4,"面粉适量、西红柿1个、水1升、鸡蛋1个","姜适量、香菜适量、香葱适量、食用油5毫升、生抽5克、盐3克、料酒3克",6,"http://127.0.0.1:9999/cp_details_img/s113291_154054281565225.jpg","喜欢小时候奶奶做的疙瘩汤",0,0),
(33,"茶叶蛋","美容养颜 健脑益智 保肝 动脉硬化 防癌 延年益寿 美容护肤",1,5,"水1升、鸡蛋8个","八角1克、桂皮1克、香叶1克、红茶10克、花椒粉2克、生抽5克、盐3克",7,"http://127.0.0.1:9999/cp_details_img/s113291_154037072762466.jpg","早餐配粥最好吃",0,0),
(34,"葱油饼","",2,5,"面粉200克、水10毫升","猪油适量、花椒粉1克、葱花适量、盐1克、食用油5毫升",7,"http://127.0.0.1:9999/cp_details_img/s113291_154037133990597.jpg","最喜欢吃的",0,0),
(35,"大盘鸡","清热去火 散瘀止疼 心血管病 消食 助消化 感冒 祛除寒气 预防感冒 治肠炎 开胃 预防中暑 防癌 延年益寿",3,4,"鸡块1000克、柿子椒1个、香菜适量、姜适量、葱适量","食用油适量、干辣椒适量、花椒适量、肉蔻适量、麻椒适量、八角适量、桂皮适量、香叶适量、郫县豆瓣酱15克、料酒适量、生抽适量、蚝油适量、盐3、鸡粉3克、糖3克",7,"http://127.0.0.1:9999/cp_details_img/s113291_154045325367062.jpg","最喜欢吃大盘鸡了",0,0),
(36,"蚝油生菜","减肥 利尿消肿",5,5,"生菜100克","蚝油5克、大蒜1瓣、食用油5毫升、白砂糖5克",7,"http://127.0.0.1:9999/cp_details_img/s113291_154054471292912.jpg","最喜欢的素菜",0,0),
(37,"蛋黄酥","健脑益智 保肝 动脉硬化 防癌 延年益寿 美容护肤 利尿 减肥 下奶 美容 排毒 高血压",1,5,"低筋面粉100克、鸡蛋1个、猪油5克、红豆沙3克、鸡蛋黄1个、芝麻1克","绵白糖5克、盐3克",8,"http://127.0.0.1:9999/cp_details_img/s113291_154037475009034.jpg","之前试过的，特别好吃",0,0),
(38,"豆浆","益智 糖尿病 降脂 防癌 更年期 延年益寿 排毒 健脑 美容养颜 抗衰老 止血 心血管病 保护心脏",4,5,"黄豆50克、黑豆20克、水200毫升、花生20克","糖适量",8,"http://127.0.0.1:9999/cp_details_img/s113291_154045566124994.jpg","无",0,0),
(39,"牛肉火锅","贫血 抗衰老 消食 延年益寿 防癌 降压 降血脂",3,4,"牛肉1000克、白萝卜500克、香菇200克","朝天椒6个、香菜2棵、姜1小块、蒜5瓣、八角2个、豆瓣酱20克、酱油10毫升、食盐8克、白糖5克、料酒5毫升、食用油20毫升、辣椒粉5克、白芝麻5克、水1000毫升、干辣椒5克",9,"http://127.0.0.1:9999/cp_details_img/s1309526_29803.jpg","如果吃腻了那种薄片的涮肉，可以尝试一下这种火锅吃法。大块大块的牛肉，软烂淳香，每一口都超极满足。捞完牛肉，再用炖肉的原汤...",0,0),
(40,"东坡肉","去火 清肺化痰 防癌 预防感冒 散瘀止疼 治肠炎 开胃 预防中暑 美容养颜",1,5,"五花肉200克、小葱适量、姜适量、水80毫升","食用油5毫升、白砂糖15克、盐3克、老抽3克、生抽20克、料酒5克",9,"http://127.0.0.1:9999/cp_details_img/s113291_154045509370624.jpg","吃腻了红烧肉的就试试东坡肉吧",0,0),
(41,"蚝油生菜","减肥 利尿消肿",5,5,"生菜100克","蚝油5克、大蒜1瓣、食用油5毫升、白砂糖5克",9,"http://127.0.0.1:9999/cp_details_img/s113291_154054471292912.jpg","最喜欢的素菜",0,0),
(42,"糖醋排骨","补肾",4,3,"排骨500克","冰糖40克、香醋40克、姜3片、料酒1汤匙、食盐3克、熟白芝麻适量、食用油1汤匙",9,"http://127.0.0.1:9999/cp_details_img/s1537765_143893021371753.jpg","糖醋排骨里的糖的用量要随自己喜好，一般我自己的习惯，一斤排骨会用40克的冰糖，如果对甜味没有那么喜爱，也可以适当减点，反之...",0,0),
(43,"转化糖浆","降压 祛痰止咳 美容养颜 润肺止咳",1,5,"柠檬2个、白砂糖200克","水100毫升",10,"http://127.0.0.1:9999/cp_details_img/s113291_155072781357676.jpg","无",0,0),
(44,"猫耳朵","好吃",1,4,"白砂糖15克、低筋面粉260克、牛奶100克、红糖30克","食用油150克",10,"http://127.0.0.1:9999/cp_details_img/s113291_155072753401573.jpg","无",0,0),
(45,"杨梅酒","助消化 防癌 预防中暑 缓解腹泻 清热解暑 润肺化痰 化痰止咳 清热去火 高血压",2,5,"杨梅适量、冰糖适量","白酒适量",10,"http://127.0.0.1:9999/cp_details_img/s113291_154088057050927.jpg","无",0,0),
(46,"双皮奶","防癌 美容养颜 通便排毒 祛痰止咳 排毒",3,5,"芒果半个、全脂牛奶250克、全脂奶粉20克","蛋清45克、白砂糖15克",10,"http://127.0.0.1:9999/cp_details_img/s113291_154338906701820.jpg","无",0,0);



/*菜谱分类*/
CREATE TABLE cp_fenlei(
fid INT PRIMARY KEY AUTO_INCREMENT,
fname VARCHAR(16),
icon VARCHAR(128)
);
INSERT INTO cp_fenlei VALUES
(NULL,"实用类型","http://127.0.0.1:9999/cp_icon/ms_fenlei_2@2x.png"),
(NULL,"每日三餐","http://127.0.0.1:9999/cp_icon/ms_fenlei_1@2x.png"),
(NULL,"主食","http://127.0.0.1:9999/cp_icon/ms_fenlei_5@2x.png"),
(NULL,"家常菜谱","http://127.0.0.1:9999/cp_icon/ms_fenlei_0@2x.png"),
(NULL,"烘焙","http://127.0.0.1:9999/cp_icon/ms_fenlei_3@2x.png"),
(NULL,"各地小吃","http://127.0.0.1:9999/cp_icon/ms_fenlei_10@2x.png");

/*菜谱类型*/
CREATE TABLE cp_type(
tid INT PRIMARY KEY AUTO_INCREMENT,
cp_fenlei_id INT,
tname VARCHAR(16),
icon VARCHAR(128)
);
INSERT INTO cp_type VALUES
(1,1,"快手菜","http://127.0.0.1:9999/cp_icon/fl_shiyongfenlei_1.png"),
(2,1,"下饭菜","http://127.0.0.1:9999/cp_icon/fl_shiyongfenlei_2.png"),
(3,1,"应季时蔬","http://127.0.0.1:9999/cp_icon/fl_shiyongfenlei_3.png"),
(4,1,"素食","http://127.0.0.1:9999/cp_icon/fl_shiyongfenlei_4.png"),
(5,1,"肉食","http://127.0.0.1:9999/cp_icon/fl_shiyongfenlei_5.png"),
(6,1,"汤","http://127.0.0.1:9999/cp_icon/fl_shiyongfenlei_6.png"),
(7,1,"家常菜","http://127.0.0.1:9999/cp_icon/fenlei_xihongshichaojidan1.png"),
(8,2,"早餐","http://127.0.0.1:9999/cp_icon/fl_sancan_1.png"),
(9,2,"午餐","http://127.0.0.1:9999/cp_icon/fl_sancan_2.png"),
(10,2,"下午茶","http://127.0.0.1:9999/cp_icon/fl_sancan_3.png"),
(11,2,"晚餐","http://127.0.0.1:9999/cp_icon/fl_sancan_4.png"),
(12,2,"夜宵","http://127.0.0.1:9999/cp_icon/fl_sancan_5.png"),
(13,3,"炒饭","http://127.0.0.1:9999/cp_icon/fl_zhushi_1.png"),
(14,3,"焖饭","http://127.0.0.1:9999/cp_icon/fl_zhushi_2.png"),
(15,3,"烩饭","http://127.0.0.1:9999/cp_icon/fl_zhushi_3.png"),
(16,3,"饭","http://127.0.0.1:9999/cp_icon/fl_zhushi_4.png"),
(17,3,"方便面","http://127.0.0.1:9999/cp_icon/fl_zhushi_5.png"),
(18,3,"焖面","http://127.0.0.1:9999/cp_icon/fl_zhushi_6.png"),
(19,3,"拌面","http://127.0.0.1:9999/cp_icon/fl_zhushi_7.png"),
(20,3,"面","http://127.0.0.1:9999/cp_icon/fl_zhushi_8.png"),
(21,3,"饼","http://127.0.0.1:9999/cp_icon/fl_zhushi_9.png"),
(22,3,"包子","http://127.0.0.1:9999/cp_icon/fl_zhushi_10.png"),
(23,3,"饺子","http://127.0.0.1:9999/cp_icon/fl_zhushi_11.png"),
(24,3,"混沌","http://127.0.0.1:9999/cp_icon/fl_zhushi_12.png"),
(25,3,"粥","http://127.0.0.1:9999/cp_icon/fl_zhushi_13.png"),
(26,4,"热菜","http://127.0.0.1:9999/cp_icon/fl_jiachangcaipu_1.png"),
(27,4,"凉菜","http://127.0.0.1:9999/cp_icon/fl_jiachangcaipu_2.png"),
(28,4,"素菜","http://127.0.0.1:9999/cp_icon/fl_jiachangcaipu_3.png"),
(29,4,"靓粥","http://127.0.0.1:9999/cp_icon/fl_jiachangcaipu_4.png"),
(30,4,"粥品","http://127.0.0.1:9999/cp_icon/fl_jiachangcaipu_5.png"),
(31,4,"主食","http://127.0.0.1:9999/cp_icon/fl_jiachangcaipu_6.png"),
(32,4,"点心","http://127.0.0.1:9999/cp_icon/fl_jiachangcaipu_7.png"),
(33,4,"卤味","http://127.0.0.1:9999/cp_icon/fl_jiachangcaipu_8.png"),
(34,4,"微波炉","http://127.0.0.1:9999/cp_icon/fl_jiachangcaipu_9.png"),
(35,4,"海鲜","http://127.0.0.1:9999/cp_icon/fl_jiachangcaipu_10.png"),
(36,4,"火锅","http://127.0.0.1:9999/cp_icon/fl_jiachangcaipu_11.png"),
(37,4,"饮品","http://127.0.0.1:9999/cp_icon/fl_jiachangcaipu_14.png"),
(38,5,"蛋糕面包","http://127.0.0.1:9999/cp_icon/fl_hongbei_1.png"),
(39,5,"饼干配方","http://127.0.0.1:9999/cp_icon/fl_hongbei_2.png"),
(40,5,"甜品点心","http://127.0.0.1:9999/cp_icon/fl_hongbei_3.png"),
(41,5,"蛋糕","http://127.0.0.1:9999/cp_icon/fl_hongbei_4.png"),
(42,5,"面包","http://127.0.0.1:9999/cp_icon/fl_hongbei_5.png"),
(43,5,"翻糖","http://127.0.0.1:9999/cp_icon/fl_hongbei_6.png");


/*菜谱详情步骤*/
CREATE TABLE cp_step(
  sid INT PRIMARY KEY AUTO_INCREMENT,
  cp_id INT, #对应菜谱的id
  step INT, #步骤， 0 代表成品图
  step_img VARCHAR(128), 
  content VARCHAR(256) 
);
INSERT INTO cp_step VALUES
(NULL,1,1,"http://127.0.0.1:9999/cp_details_img/n6030800_156172789897986.jpg","准备食材。2个鸡蛋，适量纯净水"),
(NULL,1,2,"http://127.0.0.1:9999/cp_details_img/n6030800_156172789930021.jpg","鸡蛋2个打在碗中"),
(NULL,1,3,"http://127.0.0.1:9999/cp_details_img/n6030800_156172790053813.jpg","加入1勺料酒"),
(NULL,1,4,"http://127.0.0.1:9999/cp_details_img/n6030800_156172790286826.jpg","再加入1勺盐"),
(NULL,1,5,"http://127.0.0.1:9999/cp_details_img/n6030800_156172790553962.jpg","用筷子搅拌均匀"),
(NULL,1,6,"http://127.0.0.1:9999/cp_details_img/n6030800_156172790773485.jpg","倒入和鸡蛋同样多的纯净水"),
(NULL,1,7,"http://127.0.0.1:9999/cp_details_img/n6030800_156172790880044.jpg","再次搅拌均匀，盖上保鲜膜"),
(NULL,1,8,"http://127.0.0.1:9999/cp_details_img/n6030800_156172791004924.jpg","放入蒸锅，大火烧开后状小火，蒸10分钟就好了"),
(NULL,1,9,"http://127.0.0.1:9999/cp_details_img/n6030800_156172806205479.jpg","香浓嫩滑的鸡蛋糕就蒸好了。用生抽、香醋、香油调一个汁浇在鸡蛋糕上就可以开吃了"),
(NULL,1,0,"http://127.0.0.1:9999/cp_details_img/n6030800_156172808307637.jpg",NULL),
(NULL,1,0,"http://127.0.0.1:9999/cp_details_img/n6030800_156172815445826.jpg",NULL), 
(NULL,1,0,"http://127.0.0.1:9999/cp_details_img/n6030800_156172815938921.jpg",NULL),
(NULL,1,0,"http://127.0.0.1:9999/cp_details_img/n6030800_156172816491615.jpg",NULL),
(NULL,2,1,"http://127.0.0.1:9999/cp_details_img/n3324407_156221667995046.jpg","鸡蛋加入盐打散"),
(NULL,2,2,"http://127.0.0.1:9999/cp_details_img/n3324407_156221668063894.jpg","加入葱花拌匀"),
(NULL,2,3,"http://127.0.0.1:9999/cp_details_img/n3324407_156221668177539.jpg","加入火腿肠丁拌匀"),
(NULL,2,4,"http://127.0.0.1:9999/cp_details_img/n3324407_156221668200924.jpg","加入虾仁拌匀"),
(NULL,2,5,"http://127.0.0.1:9999/cp_details_img/n3324407_156221668297197.jpg","加入面粉和少许清水搅拌成面糊"),
(NULL,2,6,"http://127.0.0.1:9999/cp_details_img/n3324407_156221668384744.jpg","锅中刷油，倒入面糊，两面煎至金黄即可"),
(NULL,2,0,"http://127.0.0.1:9999/cp_details_img/n3324407_156221668415412.jpg",NULL),
(NULL,2,0,"http://127.0.0.1:9999/cp_details_img/n3324407_156221668533344.jpg",NULL),
(NULL,2,0,"http://127.0.0.1:9999/cp_details_img/n3324407_156221668650487.jpg",NULL),
(NULL,3,1,"http://127.0.0.1:9999/cp_details_img/n5469155_154039299485215.jpg","准备好食材和份量"),
(NULL,3,2,"http://127.0.0.1:9999/cp_details_img/n5469155_154039300522000.jpg","生菜剥下叶子，用流动水冲洗干净，取绿色叶子部分，平铺在盘子里备用"),
(NULL,3,3,"http://127.0.0.1:9999/cp_details_img/n5469155_154039301573993.jpg","鸡翅尖用水清洗一下，清理掉杂毛，烧热锅放油，放入鸡翅尖"),
(NULL,3,4,"http://127.0.0.1:9999/cp_details_img/n5469155_154039302609624.jpg","小火煎到微微发黄"),
(NULL,3,5,"http://127.0.0.1:9999/cp_details_img/n5469155_154039303615924.jpg","加入料酒，生抽、蚝油一起翻炒入味，让鸡翅尖上色均匀"),
(NULL,3,6,"http://127.0.0.1:9999/cp_details_img/n5469155_154039304676680.jpg","加入一杯可乐一起煮，大概需要煮10分钟"),
(NULL,3,7,"http://127.0.0.1:9999/cp_details_img/n5469155_154039305495887.jpg","煮到可乐变浓稠，就可以关火了"),
(NULL,3,8,"http://127.0.0.1:9999/cp_details_img/n5469155_154039306242065.jpg","把鸡翅尖盛到铺有生菜的盘子里，可乐汁淋到鸡翅尖上，撒上适量的熟白芝麻"),
(NULL,3,0,"http://127.0.0.1:9999/cp_details_img/n5469155_154039316133858.jpg",NULL),
(NULL,3,0,"http://127.0.0.1:9999/cp_details_img/n5469155_154039317234145.jpg",NULL),
(NULL,3,0,"http://127.0.0.1:9999/cp_details_img/n5469155_154039318229553.jpg",NULL),
(NULL,4,1,"http://127.0.0.1:9999/cp_details_img/n2811207_156262503605159.jpg","豆腐皮放开水锅中煮30秒，捞出摊在案板上晾凉，芹菜、胡萝卜、香葱洗净"),
(NULL,4,2,"http://127.0.0.1:9999/cp_details_img/n2811207_156262503736224.jpg","胡萝卜切细丝"),
(NULL,4,3,"http://127.0.0.1:9999/cp_details_img/n2811207_156262503813417.jpg","芹菜纵切成几条，再切成寸段；香葱切寸段"),
(NULL,4,4,"http://127.0.0.1:9999/cp_details_img/n2811207_156262503922433.jpg","胡萝卜、芹菜、香葱同入一碗中，放少许盐、芝麻油拌匀，静置5分钟"),
(NULL,4,5,"http://127.0.0.1:9999/cp_details_img/n2811207_156262504074104.jpg","豆腐皮切成10公分左右的方块，边角料放进菜丝中拌匀"),
(NULL,4,6,"http://127.0.0.1:9999/cp_details_img/n2811207_156262504280718.jpg","取一张豆腐皮，将适量的菜料铺在底部，尽可能铺得均匀"),
(NULL,4,7,"http://127.0.0.1:9999/cp_details_img/n2811207_156262504378542.jpg","从下向上卷起来，开始的时候尽量卷得紧一些"),
(NULL,4,8,"http://127.0.0.1:9999/cp_details_img/n2811207_156262504455186.jpg","4张豆腐皮全部卷好了，菜也刚刚好；排成排，用刀拦腰一截成8根，再把每一根在中间位置斜切成小段"),
(NULL,4,9,"http://127.0.0.1:9999/cp_details_img/n2811207_156262504544965.jpg","找个大盘子，摆成花形，摆不了的就放在一个小盘里，如果不讲究造型，直接摞起来也成。菜料已经用盐和芝麻油调过味儿了，如果觉得还不够浓郁，可以来点甜面酱蘸着吃"),
(NULL,4,0,"http://127.0.0.1:9999/cp_details_img/n2811207_156262514839256.jpg",NULL),
(NULL,4,0,"http://127.0.0.1:9999/cp_details_img/n2811207_156262515008699.jpg",NULL),
(NULL,4,0,"http://127.0.0.1:9999/cp_details_img/n2811207_156262515046305.jpg",NULL),
(NULL,5,1,"https://s1.st.meishij.net/rs/200/60/13640200/n13640200_156258557903026.jpg","准备好需要的材料"),
(NULL,5,2,"https://s1.st.meishij.net/rs/200/60/13640200/n13640200_156258557942271.jpg","碗里打入两个鸡蛋"),
(NULL,5,3,"https://s1.st.meishij.net/rs/200/60/13640200/n13640200_156258557983083.jpg","除黄油以外的材料混合"),
(NULL,5,4,"https://s1.st.meishij.net/rs/200/60/13640200/n13640200_156258557996203.jpg","用蛋抽搅拌均匀"),
(NULL,5,5,"https://s1.st.meishij.net/rs/200/60/13640200/n13640200_156258558067888.jpg","烤箱预热200度，铸铁锅内融化黄油"),
(NULL,5,6,"https://s1.st.meishij.net/rs/200/60/13640200/n13640200_156258558180305.jpg","搅拌均匀的面糊倒入锅内，放入烤箱200度烘烤20分钟"),
(NULL,5,7,"https://s1.st.meishij.net/rs/200/60/13640200/n13640200_156258558290082.jpg","（膨胀的样子）"),
(NULL,5,8,"https://s1.st.meishij.net/rs/200/60/13640200/n13640200_156258558224563.jpg","放上水果，或者打发点奶油，再撒点糖粉就好啦"),
(NULL,5,0,"https://s1.st.meishij.net/rs/200/60/13640200/n13640200_156258558265268.jpg",NULL),
(NULL,5,0,"https://s1.st.meishij.net/rs/200/60/13640200/n13640200_156258558301439.jpg",NULL),
(NULL,6,1,"https://s1.st.meishij.net/rs/197/168/3542197/n3542197_156237341224675.jpg","香肠蒸熟待用"),
(NULL,6,2,"https://s1.st.meishij.net/rs/197/168/3542197/n3542197_156237341411274.jpg","鸡蛋打散"),
(NULL,6,3,"https://s1.st.meishij.net/rs/197/168/3542197/n3542197_156237341665508.jpg","面包片切去片"),
(NULL,6,4,"https://s1.st.meishij.net/rs/197/168/3542197/n3542197_156237341788614.jpg","然后用擀面杖压一下"),
(NULL,6,5,"https://s1.st.meishij.net/rs/197/168/3542197/n3542197_156237341832972.jpg","然后加入芝士片"),
(NULL,6,6,"https://s1.st.meishij.net/rs/197/168/3542197/n3542197_156237341913504.jpg","四周涂上鸡蛋液后加入一根香肠"),
(NULL,6,7,"https://s1.st.meishij.net/rs/197/168/3542197/n3542197_156237342159507.jpg","然后卷起来"),
(NULL,6,8,"https://s1.st.meishij.net/rs/197/168/3542197/n3542197_156237342115676.jpg","表面涂上鸡蛋液，撒上面包糠"),
(NULL,6,9,"https://s1.st.meishij.net/rs/197/168/3542197/n3542197_156237342437144.jpg","放进空气炸锅炸10分钟左右"),
(NULL,6,10,"https://s1.st.meishij.net/rs/197/168/3542197/n3542197_156237342469945.jpg","用科尔沁波兰式牛肉肠，做出百变儿童料理！"),
(NULL,6,0,"https://s1.st.meishij.net/rs/197/168/3542197/n3542197_156237342671880.jpg",NULL),
(NULL,6,0,"https://s1.st.meishij.net/rs/197/168/3542197/n3542197_156237342724604.jpg",NULL),
(NULL,6,0,"https://s1.st.meishij.net/rs/197/168/3542197/n3542197_156237342751559.jpg",NULL),
(NULL,6,0,"https://s1.st.meishij.net/rs/197/168/3542197/n3542197_156237342934238.jpg",NULL),
(NULL,7,1,"https://s1.st.meishij.net/rs/63/180/6482563/n6482563_156247245706892.jpg","腐竹要提前浸泡哦，我是晚上吃所以早上出门之前泡上回来就刚刚好 冷水泡的 泡软的腐竹用剪刀剪成小段，然后锅里水烧开 放入腐竹，煮大概三四分钟即可，捞出来沥干水待用"),
(NULL,7,2,"https://s1.st.meishij.net/rs/63/180/6482563/n6482563_156247245849685.jpg","花生米也一样，生的花生米早上浸泡起来，锅里水烧开 泡好的花生米倒进去煮一会儿 至于时间你们可以尝一下，每个人喜欢的软硬度都不一样 个人觉得硬一点口感更好哦"),
(NULL,7,3,"https://s1.st.meishij.net/rs/63/180/6482563/n6482563_156247246417894.jpg","黄瓜外皮用刀背弄掉一些，清洗干净 然后对半切开，刀背用力拍打几下"),
(NULL,7,4,"https://s1.st.meishij.net/rs/63/180/6482563/n6482563_156247246287555.jpg","看到没有，里面的瓤不要"),
(NULL,7,5,"https://s1.st.meishij.net/rs/63/180/6482563/n6482563_156247246606461.jpg","切斜刀断"),
(NULL,7,6,"https://s1.st.meishij.net/rs/63/180/6482563/n6482563_156247246334857.jpg","黄瓜撒盐，腌制一会儿，把里面的水分逼出来才会有脆感"),
(NULL,7,7,"https://s1.st.meishij.net/rs/63/180/6482563/n6482563_156247249646627.jpg","腐竹放入一个大一点的容器好方便搅拌"),
(NULL,7,8,"https://s1.st.meishij.net/rs/63/180/6482563/n6482563_156247249785108.jpg","在接着倒入花生米"),
(NULL,7,9,"https://s1.st.meishij.net/rs/63/180/6482563/n6482563_156247249882182.jpg","黄瓜也倒进去"),
(NULL,7,10,"https://s1.st.meishij.net/rs/63/180/6482563/n6482563_156247249944289.jpg","适量芝麻油"),
(NULL,7,11,"https://s1.st.meishij.net/rs/63/180/6482563/n6482563_156247250072614.jpg","一勺生抽，半勺凉拌汁儿"),
(NULL,7,12,"https://s1.st.meishij.net/rs/63/180/6482563/n6482563_156247251101728.jpg","一勺香醋"),
(NULL,7,13,"https://s1.st.meishij.net/rs/63/180/6482563/n6482563_156247251242487.jpg","两勺自制的辣椒油【辣椒油做法前面发过的，自己找一下】"),
(NULL,7,14,"https://s1.st.meishij.net/rs/63/180/6482563/n6482563_156247251301794.jpg","适量盐，鸡粉，白糖"),
(NULL,7,15,"https://s1.st.meishij.net/rs/63/180/6482563/n6482563_156247251475716.jpg","喜欢吃辣的亲可以丢一些小米辣进去"),
(NULL,7,16,"https://s1.st.meishij.net/rs/63/180/6482563/n6482563_156247251583130.jpg","蒜米生姜沫少许"),
(NULL,7,17,"https://s1.st.meishij.net/rs/63/180/6482563/n6482563_156247251604555.jpg","拌匀，冰箱里放一会儿，口感更好"),
(NULL,7,18,"https://s1.st.meishij.net/rs/63/180/6482563/n6482563_156247255221018.jpg","哈哈，你们真的可以试试，我朋友不能吃太辣的，但是说太好吃结果停不下来 结果这一盆都是她吃掉的"),
(NULL,7,19,"https://s1.st.meishij.net/rs/63/180/6482563/n6482563_156247255699211.jpg","番茄土豆炖牛腩"),
(NULL,7,20,"https://s1.st.meishij.net/rs/63/180/6482563/n6482563_156247255932045.jpg","紫菜鸡蛋汤"),
(NULL,7,21,"https://s1.st.meishij.net/rs/63/180/6482563/n6482563_156247256380562.jpg","生活有两大误区： 一是生活给人看， 二是看别人生活。 只要自己觉得幸福就行， 用不着向别人证明什么。 千万不要光顾着看别人， 而走错了自己脚下的路。 "),
(NULL,7,0,"https://s1.st.meishij.net/rs/63/180/6482563/n6482563_156247256618479.jpg",NULL),
(NULL,7,0,"https://s1.st.meishij.net/rs/63/180/6482563/n6482563_156247256940281.jpg",NULL),
(NULL,8,1,"https://s1.st.meishij.net/rs/197/182/6108197/n6108197_156189893893421.jpg","首先备齐所有的食材"),
(NULL,8,2,"https://s1.st.meishij.net/rs/197/182/6108197/n6108197_156189893985790.jpg","海兔洗净后，用清水浸泡半小时。"),
(NULL,8,3,"https://s1.st.meishij.net/rs/197/182/6108197/n6108197_156189893998939.jpg","木耳洗净后，浸泡一会儿"),
(NULL,8,4,"https://s1.st.meishij.net/rs/197/182/6108197/n6108197_156189894080008.jpg","鸡蛋打散后，倒入料酒搅拌均匀，锅烧热后倒入花生油烧热，把搅拌好的鸡蛋液炒熟后关火"),
(NULL,8,5,"https://s1.st.meishij.net/rs/197/182/6108197/n6108197_156189894112302.jpg","浸泡好的海兔，沥干水分后，用刀切成小丁，记住不要切的太碎哟。"),
(NULL,8,6,"https://s1.st.meishij.net/rs/197/182/6108197/n6108197_156189894232098.jpg","泡发好的木耳洗净后，用刀切碎"),
(NULL,8,7,"https://s1.st.meishij.net/rs/197/182/6108197/n6108197_156189894342258.jpg","韭菜摘洗干净后切碎，把葱姜切碎，香菜切末"),
(NULL,8,8,"https://s1.st.meishij.net/rs/197/182/6108197/n6108197_156189894392083.jpg","把切好的韭菜和香菜，葱姜和木耳，海兔放入炒鸡蛋的锅中，先根据个人口味加入适量的盐调味"),
(NULL,8,9,"https://s1.st.meishij.net/rs/197/182/6108197/n6108197_156189894572875.jpg","再放入鸡精增加口感。"),
(NULL,8,10,"https://s1.st.meishij.net/rs/197/182/6108197/n6108197_156189894543372.jpg","再加入花椒粉增加香味"),
(NULL,8,11,"https://s1.st.meishij.net/rs/197/182/6108197/n6108197_156189894794812.jpg","最后加入自制猪油"),
(NULL,8,12,"https://s1.st.meishij.net/rs/197/182/6108197/n6108197_156189894892164.jpg","把所有的食材搅拌均匀即可"),
(NULL,8,13,"https://s1.st.meishij.net/rs/197/182/6108197/n6108197_156189894897675.jpg","把称重的面粉和菠菜粉，倒入面包机中，倒入清水后，启动和面程序开始和面"),
(NULL,8,14,"https://s1.st.meishij.net/rs/197/182/6108197/n6108197_156189895090016.jpg","和好的面团松弛半个小时"),
(NULL,8,15,"https://s1.st.meishij.net/rs/197/182/6108197/n6108197_156189895079851.jpg","松弛好的面团，揉匀后搓成长条，揪成大小一致的剂子，摁扁后用擀面杖擀成圆形薄面皮"),
(NULL,8,16,"https://s1.st.meishij.net/rs/197/182/6108197/n6108197_156189895296637.jpg","擀好的面皮，放入适量调制好的馅料"),
(NULL,8,17,"https://s1.st.meishij.net/rs/197/182/6108197/n6108197_156189895221733.jpg","包成自己喜欢的模样即可，依次包完所有的饺子"),
(NULL,8,18,"https://s1.st.meishij.net/rs/197/182/6108197/n6108197_156189895307104.jpg","锅中倒入适量的清烧开后，放入包好的饺子，大火煮沸后，点少许清水，反复3次，看见所有的饺子都漂浮在水面上即可"),
(NULL,8,0,"https://s1.st.meishij.net/rs/197/182/6108197/n6108197_156189895338709.jpg",NULL),
(NULL,8,0,"https://s1.st.meishij.net/rs/197/182/6108197/n6108197_156189895437409.jpg",NULL),
(NULL,8,0,"https://s1.st.meishij.net/rs/197/182/6108197/n6108197_156189895454909.jpg",NULL),
(NULL,9,1,"https://s1.st.meishij.net/rs/208/102/1025708/n1025708_156144990505117.jpg","食材都准备好，红薯粉条事先用稍微折成短断，吃起来会更方便，太长条的红薯粉，真的要拿个梯子才能够得着"),
(NULL,9,2,"https://s1.st.meishij.net/rs/208/102/1025708/n1025708_156144990672074.jpg","红薯粉放入冷水中浸泡至微微变软，煮起来会比较省时"),
(NULL,9,3,"https://s1.st.meishij.net/rs/208/102/1025708/n1025708_156144990878843.jpg","姜蒜切末，红尖椒切圈，香菜稍微切成短一点的段"),
(NULL,9,4,"https://s1.st.meishij.net/rs/208/102/1025708/n1025708_156144991217972.jpg","陈醋、生抽、辣椒油、盐放入碗里，将姜蒜末和红椒段放入酱汁中腌制入味"),
(NULL,9,5,"https://s1.st.meishij.net/rs/208/102/1025708/n1025708_156144991137274.jpg","锅里放水，将泡好的红薯粉倒入锅中，水开后再煮两分钟，用筷子挑起红薯粉，变得柔软即可捞出来了"),
(NULL,9,6,"https://s1.st.meishij.net/rs/208/102/1025708/n1025708_156144991338440.jpg","舀一勺煮红薯粉的开水倒入调好的味汁中，调匀成汤汁备用"),
(NULL,9,7,"https://s1.st.meishij.net/rs/208/102/1025708/n1025708_156144991428792.jpg","将煮好的红薯粉捞出来，倒入汤汁中，拌匀后撒上香菜，码上花生米即可开吃了"),
(NULL,9,0,"https://s1.st.meishij.net/rs/208/102/1025708/n1025708_156144991409891.jpg",NULL),
(NULL,9,0,"https://s1.st.meishij.net/rs/208/102/1025708/n1025708_156144991551236.jpg",NULL),
(NULL,9,0,"https://s1.st.meishij.net/rs/208/102/1025708/n1025708_156144991760089.jpg",NULL),
(NULL,9,0,"https://s1.st.meishij.net/rs/208/102/1025708/n1025708_156144991880549.jpg",NULL),
(NULL,10,1,"https://s1.st.meishij.net/rs/10/120/30010/n30010_154796206042407.gif","炒锅无水无油烧热，将三种辣椒一起倒入锅中，小火翻炒，大概20分钟左右，辣椒中水分蒸发，辣椒变得更硬更脆。（一定要用小火，并且用锅铲不断翻炒，不然很容易变黑，大面积发黑的辣椒不要使用了，辣椒一次炒不完，可以分几锅炒制。）"),
(NULL,10,2,"https://s1.st.meishij.net/rs/10/120/30010/n30010_154796206214543.gif","炒好的辣椒倒入铸铁捣碎器中，捣碎成粗颗粒状，不要太细，辣椒油更香，且淋油的时候不容易糊。（如果家中有破壁机，研磨机的就直接用机器，效果一样，且更省事，中途记得开盖观察状态，不要打的太碎。）"),
(NULL,10,3,"https://s1.st.meishij.net/rs/10/120/30010/n30010_154796206397842.gif","捣好的辣椒粉倒入碗中。"),
(NULL,10,4,"https://s1.st.meishij.net/rs/10/120/30010/n30010_154796206423924.gif","锅中倒入适量香满园天府老巷菜籽油，大火烧至油冒烟即可"),
(NULL,10,5,"https://s1.st.meishij.net/rs/10/120/30010/n30010_154796206670354.gif","转中火，倒入大葱段、八角、香叶、桂皮、花椒、茴香、草果，炸香。炸约2到3分钟关火，然后用滤网捞出丢弃，"),
(NULL,10,6,"https://s1.st.meishij.net/rs/10/120/30010/n30010_154796206988356.gif","用大汤勺舀一勺热油倒入辣椒粉中，并用筷子搅拌，继续再倒热油，再搅拌，直至混合均匀。"),
(NULL,10,7,"https://s1.st.meishij.net/rs/10/120/30010/n30010_154796207184883.gif","再撒适量白芝，搅拌均匀"),
(NULL,10,8,"https://s1.st.meishij.net/rs/10/120/30010/n30010_154796207262591.gif","辣红油辣子就做好啦，静置一夜，红油会更红亮，色泽更好看"),
(NULL,10,0,"https://s1.st.meishij.net/rs/10/120/30010/n30010_154796213499314.jpg","烹饪技巧
TIPS
1/ 熬好的辣椒油倒入无水无油，消毒好的玻璃瓶中，冷却后密封保存，可以放一年之久，冰箱冷藏保存辣椒与个用时用无水无油的干净勺子，辣油能存放更久
2/ 三种辣椒的作用各不同，不那么讲究的话用一种辣椒也可以。自己研磨的辣椒粉更香一些，偷懒的话就买辣椒粉也能做");


/*口味*/
CREATE TABLE cp_kouwei(
  kid INT PRIMARY KEY AUTO_INCREMENT,
  kname VARCHAR(16)
);
INSERT INTO cp_kouwei VALUES
(1,"家常味"),
(2,"香辣味"),
(3,"咸鲜味"),
(4,"甜味"),
(5,"酸甜味"),
(6,"酸辣味"),
(7,"麻辣味"),
(8,"酱香味"),
(9,"奶香味"),
(10,"蒜香味"),
(11,"鱼香味"),
(12,"葱香味"),
(13,"五香味"),
(14,"茄汁味"),
(15,"酸味"),
(NULL,"苦香味"),
(NULL,"姜汁味"),
(NULL,"芥末味"),
(NULL,"红油味"),
(NULL,"豆瓣味"),
(NULL,"麻酱味"),
(NULL,"黑椒味"),
(NULL,"胡辣味"),
(NULL,"其它");



CREATE TABLE cp_shicai(
  sid INT PRIMARY KEY AUTO_INCREMENT,
  sname VARCHAR(16)
);
INSERT INTO cp_shicai VALUES
(1,"鸡肉"),
(2,"鸭肉"),
(3,"牛肉"),
(4,"猪肉"),
(5,"羊肉"),
(6,"兔肉"),
(7,"白菜"),
(8,"娃娃菜"),
(9,"生菜"),
(10,"荷兰豆"),
(11,"土豆"),
(12,"茄子"),
(13,"豆角"),
(14,"西红柿"),
(15,"苦瓜"),
(16,"青瓜"),
(17,"南瓜"),
(18,"冬瓜"),
(19,"山药"),
(20,"胡萝卜"),
(21,"白萝卜"),
(22,"空心菜"),
(23,"菜心"),
(24,"春菜"),
(25,"油麦菜"),
(26,"花生"),
(27,"黄豆"),
(28,"黑芝麻"),
(29,"红豆"),
(30,"绿豆"),
(31,"小麦"),
(32,"小米"),
(33,"赤豆"),
(34,"黑豆"),
(35,"糯米"),
(36,"地瓜"),
(37,"西米"),
(38,"毛豆"),
(39,"四季豆"),
(40,"酸豆角"),
(41,"豆腐"),
(42,"鱼"),
(43,"草鱼"),
(44,"章鱼"),
(45,"鱿鱼"),
(46,"小虾米"),
(47,"虾"),
(48,"小龙虾"),
(49,"鸡蛋"),
(50,"木耳"),
(51,"银耳"),
(52,"蘑菇"),
(53,"金针菇"),
(54,"韭菜"),
(55,"韭黄"),
(56,"紫薯"),
(57,"红薯"),
(58,"鱼丸"),
(59,"牛肉丸"),
(60,"猪肉丸");
