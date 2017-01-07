## AndroidRipper 运行指南

#### 共分为四步

要测试一个 AUT:`tippy`，**第一步**：<font color=blue>修改 `ripper.properties` 和 `systematic/properties` 这两个配置文件</font>。 // 作用是 指明 待测APP。

1. 脚本1️⃣ `ARinstall.sh`

	**第二步**：重置并启动模拟器  `sh resetEmulator.sh (慎用)`，或直接启动模拟器 `sh startEmulator.sh`
	
	``` 
	// ❌ 不可轻易使用
	android delete avd -n RipperDevice
	android create avd -n RipperDevice -t android-17 -c 1024M -b armeabi-v7a
	// ✅
	emulator -avd RipperDevice
	```
	- 作用：安装 AUT & AndroidRipper测试环境。
	
	**第三步**：运行脚本 <font color="blue">`sh ARinstall.sh`</font>，安装 测试环境，安装完毕后 关闭模拟器 `adb emu kill`	

2. 脚本2️⃣ `ARdrive.sh`
	
	**第四步**：运行脚本 <font color="blue">`sh ARdrive.sh`</font>，进行测试，需要自己掌握测试时间。
	
	- 作用：调用 SystematicDriver 对AUT进行 DFS 遍历测试。测试期间也会产生 Emma 覆盖元数据。

3. 脚本3️⃣ `collectInfo.sh`

	**第五步**：测试完成后，收集全部的测试数据。
	
	<font color="blue">eg: `sh collectInfo_AR.sh net.fercanet.LNM_3_src net.fercanet.LNM`  
	`sh rename_ec.sh whohasmystuff-1.0.7`
	</font>

	- 正确位置：AndroidTGTools/tools/AndroidRipper/AR_run/
	- 作用：收集由第2️⃣步测试所产生的覆盖元数据 (em, ec 文件)

4. 脚本4️⃣ `genEmma.sh`
	
	**第六步**：测试数据收集完毕后，生成 Emma 测试报告。 
	
	- 作用：只是提供一个利用覆盖元数据生成HTML报告的命令，此脚本并不可直接运行。
	
	```
	1: cd ./AR_run/aut_coverage/aut
	2: java -cp /Users/zhchuch/Downloads/adt-bundle-mac-x86_64-20140702/sdk/tools/lib/emma.jar emma report -r html -in coverage.em,coverage1.ec,coverage2.ec,coverage3.ec,coverage4.ec,coverage5.ec,coverage6.ec,coverage7.ec,coverage8.ec,coverage9.ec,coverage10.ec,coverage11.ec,coverage12.ec,coverage13.ec,coverage14.ec,coverage15.ec
	```

本地地址：`~/Desktop/paper/Backup/constrast_experi/ATGT/AndroidRipper`
