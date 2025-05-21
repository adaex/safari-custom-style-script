#!/bin/bash

# 清理旧文件
rm -rf ./build ./dist

# 创建必要的目录结构
mkdir -p build/extension
mkdir -p dist

# 复制扩展文件到构建目录
cp -r manifest.json custom icons build/extension/

# 创建 Safari Web 扩展项目
xcrun safari-web-extension-converter ./build/extension \
  --project-location ./build \
  --app-name "CustomStyleExtension" \
  --bundle-identifier "com.yourdomain.customstyle" \
  --copy-resources \
  --swift \
  --force

# 构建应用
cd build/CustomStyleExtension
xcodebuild -project CustomStyleExtension.xcodeproj -scheme CustomStyleExtension -configuration Release

# 复制构建好的应用到 dist 目录
cp -r build/Release/CustomStyleExtension.app ../../dist/

echo "构建完成！应用位于 dist/CustomStyleExtension.app"
echo "要分发此应用，请用您的开发者证书签名："
echo "codesign -s '您的证书名称' dist/CustomStyleExtension.app --deep"
