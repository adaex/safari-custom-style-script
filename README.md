# Safari 自定义样式扩展

这是一个 Safari 扩展，用于在网站上应用自定义样式。

## 安装要求

- macOS 10.15 或更高版本
- Safari 14 或更高版本
- Xcode 12 或更高版本（仅用于构建）
- Apple 开发者证书（用于签名）

## 构建和安装步骤

1. 克隆此仓库
2. 创建 `icons` 目录，并添加图标文件（icon-48.png 和 icon-128.png）
3. 运行构建脚本：`chmod +x build.sh && ./build.sh`
4. 使用您的开发者证书签名：`codesign -s '您的证书名称' dist/CustomStyleExtension.app --deep`
5. 将签名后的应用复制到您的应用程序文件夹
6. 启动应用
7. 在 Safari 的"偏好设置" > "扩展"中启用该扩展

## 自定义样式

您可以在 `custom/yuanbao.css` 文件中添加或修改自定义样式。

## 分发

分发时，将签名后的 `.app` 文件分享给用户。用户需要：

1. 将应用移动到应用程序文件夹
2. 首次启动时右键点击应用并选择"打开"以绕过 Gatekeeper
3. 在 Safari 的扩展设置中启用此扩展
