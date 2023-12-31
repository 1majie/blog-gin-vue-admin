<!--
 * @Author: freedom 957420317@qq.com
 * @Date: 2023-12-06 20:41:55
 * @LastEditors: freedom 957420317@qq.com
 * @LastEditTime: 2023-12-31 10:31:13
 * @FilePath: \blog_before_vue3_nuxt\README.md
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
-->
一码界博客系统
本人为实现博客系统可控性，开发此博客系统。
### 技术架构
框架主体：nuxt3+vue3+vite+daisyui+tailwindcss
### 实现的功能 v 0.0.1 buid-20231112
- [x] 根据菜单查询内容
- [x] 查看博客内容详情
- [ ] 关联展示内容的标签
- [ ] 关联展示作者信息
- [ ] 关联展示当前类的其他博客内容
- [ ] 美化内容展示样式
- [ ] 集成代码样式
- [ ] 集成评论系统
- [ ] 集成搜索功能
- [ ] 集成登录注册功能
- [ ] 集成用户管理功能
- [ ] 集成文章管理功能
- [ ] 集成分类管理功能
- [ ] 集成标签管理功能
- [ ] 集成友链管理功能


  
## 一码界博客系统
作为一名程序员对博客系统不可控，心里不爽，再造轮子一枚。本博客包括前端和后端管理系统，前端系统为nuxt3，后台管理系统基于[gin-vue-admin](https://www.gin-vue-admin.com/)开发。后端数据库设计参考[Typecho博客设计](https://docs.typecho.org/database)
### gitee
前端仓库地址：
[blog](https://gitee.com/onemajie/blog.git)
后端仓库地址：
[blog-gin-vue-admin](https://gitee.com/onemajie/blog-gin-vue-admin.git)
### github
前端仓库地址：
[blog](https://github.com/1majie/blog.git)
后端仓库地址：
[blog-gin-vue-admin](https://github.com/1majie/blog-gin-vue-admin.git)

### 在线博客地址
[一码界](https://www.1majie.com/)

### 实现的功能 v 1.0.0 buid-20231231
- [x] 支持亮暗主题切换
- [x] 支持多语言
- [x] 支持markdown
- [x] 支持富文本编辑
- [x] 支持搜索
- [x] 支持评论
- [x] 支持博文推荐
- [x] 支持系列文章
- [x] 支持文章锚点目录
- [x] 支持标签
- [x] 支持赞赏
- [x] 支持博主信息
- [x] 支持SEO优化
- [x] 支持站点地图
- [x] 支持移动端，pc优先
- [x] 支持环境变量


### 主要技术
#### 框架主体：
1. [nuxt3](https://nuxt.com/) （SSR）
2. [vue3](https://vuejs.org/)
3. [vite](https://vitejs.dev/) （构建工具）
4. [daisyui](https://daisyui.com/docs/themes/) (UI库)
5. [tailwindcss](https://tailwindcss.com/)（UI库）

#### 其他组件：

1. [i18n](https://nuxt.com/modules/i18n)（多语言）
2. [google-fonts](https://nuxt.com/modules/google-fonts) （字体）
3. [nuxt-icon](https://nuxt.com/modules/icon) （图标）
4. [color-mode](https://nuxt.com/modules/color-mode)（亮黑主题）
5. [artalk](https://artalk.js.org/guide/deploy.html)（评论系统）
6. [md-editor-v3](https://github.com/imzbf/md-editor-v3) （markdown预览）
7. [prismjs](https://prismjs.com/)（代码高亮）
8. [nuxt-simple-sitemap](https://nuxt.com/modules/simple-sitemap)（网站地图）

### 界面效果
#### 博客后台
##### 文章管理
![](https://www.1majie.com/api/uploads/file/be53a0541a6d36f6ecb879fa2c584b08_20231231102356.png)
##### 文章编辑（富文本编辑器）
![](https://www.1majie.com/api/uploads/file/91eee3f8d75dbb327ede474944726554_20231231102456.png)
##### 文章编辑（markdown）
![](https://www.1majie.com/api/uploads/file/f7cb588f62bc16ba6c8ac0b4956bd711_20231231102549.png)
##### 项目管理界面
![](https://www.1majie.com/api/uploads/file/caebd5802a502287b56167f6208b00f3_20231231102416.png)
#### 博客前端
##### 文章列表
![](https://www.1majie.com/api/uploads/file/7788f29195a2edf255b072ee25029997_20231231102609.png)
##### 文章内容
![](https://www.1majie.com/api/uploads/file/905100afa8889d8584ad793d20552c6f_20231231102617.png)
