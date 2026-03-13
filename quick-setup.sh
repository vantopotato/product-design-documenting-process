#!/bin/bash

# --- 🚀 Claude Skill 快速配置脚本 ---

# 颜色设置
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m' 

echo -e "${BLUE}========================================================${NC}"
echo -e "${GREEN}      欢迎使用 Claude Skill 快速配置脚本！${NC}"
echo -e "${BLUE}========================================================${NC}"
echo "我们将通过几个简单的问题，将模板转换为您的个性化 CLAUDE.md。"
echo ""

# 互动询问
read -p "1. 请输入您的业务/领域名称 (例如：内容推荐、商业化): " biz_name
read -p "2. 请输入您的核心关注指标 (例如：转化率、ROI、LTV): " metrics
read -p "3. 请输入一条最核心的避坑规则 (例如：严禁破坏现有缓存逻辑): " core_rule

# 检查模板文件是否存在
if [ -f "CLAUDE_TEMPLATE.md" ]; then
    echo -e "\n正在生成 CLAUDE.md..."
    cp CLAUDE_TEMPLATE.md CLAUDE.md
    
    # 针对 Mac 的 sed 命令进行精确转义替换
    # 替换领域和角色信息
    sed -i '' "s/\[填写领域，如：商业化策略\/产品运营\]/${biz_name}/g" CLAUDE.md
    # 替换核心目标占位符
    sed -i '' "s/\[填写核心目标\]/优化 ${biz_name} 的整体业务表现/g" CLAUDE.md
    # 替换指标
    sed -i '' "s/\[指标 A\]/${metrics}/g" CLAUDE.md
    # 替换核心规则
    sed -i '' "s/\[在此输入你的特定业务规则.*\]/${core_rule}/g" CLAUDE.md
    
    echo -e "${BLUE}--------------------------------------------------------${NC}"
    echo -e "${GREEN}✅ 成功！CLAUDE.md 已在当前目录下生成。${NC}"
    echo "提示：您可以继续手动编辑 CLAUDE.md 来完善细节。"
    echo -e "${BLUE}--------------------------------------------------------${NC}"
else
    echo -e "${RED}❌ 错误：未找到 CLAUDE_TEMPLATE.md 模板文件。${NC}"
    exit 1
fi
