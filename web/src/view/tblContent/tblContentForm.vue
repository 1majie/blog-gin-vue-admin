<template>
  <div>
    <div class="gva-form-box">
      <el-form :model="formData" ref="elFormRef" label-position="right" :rules="rule" label-width="80px">
        <el-form-item label="是否允许评论:" prop="allowComment">
          <el-input v-model="formData.allowComment" :clearable="true" placeholder="请输入" />
       </el-form-item>
        <el-form-item label="作者ID:" prop="authorId">
          <el-input v-model.number="formData.authorId" :clearable="true" placeholder="请输入" />
       </el-form-item>
        <el-form-item label="内容所属评论数:" prop="commentsNum">
          <el-input v-model.number="formData.commentsNum" :clearable="true" placeholder="请输入" />
       </el-form-item>
        <el-form-item label="内容文字:" prop="content">
          <el-input v-model="formData.content" :clearable="true" placeholder="请输入" />
       </el-form-item>
        <el-form-item label="创建时间:" prop="createTime">
          <el-date-picker v-model="formData.createTime" type="date" placeholder="选择日期" :clearable="true"></el-date-picker>
       </el-form-item>
        <el-form-item label="踩数量:" prop="downNum">
          <el-input v-model.number="formData.downNum" :clearable="true" placeholder="请输入" />
       </el-form-item>
        <el-form-item label="内容图片路径:" prop="img">
          <el-input v-model="formData.img" :clearable="true" placeholder="请输入" />
       </el-form-item>
        <el-form-item label="点赞数量:" prop="likesNum">
          <el-input v-model.number="formData.likesNum" :clearable="true" placeholder="请输入" />
       </el-form-item>
        <el-form-item label="内容顺序:" prop="order">
          <el-input v-model.number="formData.order" :clearable="true" placeholder="请输入" />
       </el-form-item>
        <el-form-item label="保护密码:" prop="password">
          <el-input v-model="formData.password" :clearable="true" placeholder="请输入" />
       </el-form-item>
        <el-form-item label="分享数量:" prop="shareNum">
          <el-input v-model.number="formData.shareNum" :clearable="true" placeholder="请输入" />
       </el-form-item>
        <el-form-item label="内容状态:" prop="status">
          <el-input v-model="formData.status" :clearable="true" placeholder="请输入" />
       </el-form-item>
        <el-form-item label="内容摘要:" prop="summary">
          <el-input v-model="formData.summary" :clearable="true" placeholder="请输入" />
       </el-form-item>
        <el-form-item label="内容标题:" prop="title">
          <el-input v-model="formData.title" :clearable="true" placeholder="请输入" />
       </el-form-item>
        <el-form-item label="内容类别:" prop="type">
          <el-input v-model="formData.type" :clearable="true" placeholder="请输入" />
       </el-form-item>
        <el-form-item label="修改时间:" prop="updateTime">
          <el-date-picker v-model="formData.updateTime" type="date" placeholder="选择日期" :clearable="true"></el-date-picker>
       </el-form-item>
        <el-form-item label="浏览数量:" prop="viemNum">
          <el-input v-model.number="formData.viemNum" :clearable="true" placeholder="请输入" />
       </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="save">保存</el-button>
          <el-button type="primary" @click="back">返回</el-button>
        </el-form-item>
      </el-form>
    </div>
  </div>
</template>

<script setup>
import {
  createTblContent,
  updateTblContent,
  findTblContent
} from '@/api/tblContent'

defineOptions({
    name: 'TblContentForm'
})

// 自动获取字典
import { getDictFunc } from '@/utils/format'
import { useRoute, useRouter } from "vue-router"
import { ElMessage } from 'element-plus'
import { ref, reactive } from 'vue'

const route = useRoute()
const router = useRouter()

const type = ref('')
const formData = ref({
            allowComment: '',
            authorId: 0,
            commentsNum: 0,
            content: '',
            createTime: new Date(),
            downNum: 0,
            img: '',
            likesNum: 0,
            order: 0,
            password: '',
            shareNum: 0,
            status: '',
            summary: '',
            title: '',
            type: '',
            updateTime: new Date(),
            viemNum: 0,
        })
// 验证规则
const rule = reactive({
})

const elFormRef = ref()

// 初始化方法
const init = async () => {
 // 建议通过url传参获取目标数据ID 调用 find方法进行查询数据操作 从而决定本页面是create还是update 以下为id作为url参数示例
    if (route.query.id) {
      const res = await findTblContent({ ID: route.query.id })
      if (res.code === 0) {
        formData.value = res.data.retblContent
        type.value = 'update'
      }
    } else {
      type.value = 'create'
    }
}

init()
// 保存按钮
const save = async() => {
      elFormRef.value?.validate( async (valid) => {
         if (!valid) return
            let res
           switch (type.value) {
             case 'create':
               res = await createTblContent(formData.value)
               break
             case 'update':
               res = await updateTblContent(formData.value)
               break
             default:
               res = await createTblContent(formData.value)
               break
           }
           if (res.code === 0) {
             ElMessage({
               type: 'success',
               message: '创建/更改成功'
             })
           }
       })
}

// 返回按钮
const back = () => {
    router.go(-1)
}

</script>

<style>
</style>
