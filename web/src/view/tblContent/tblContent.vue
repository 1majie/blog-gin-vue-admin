<template>
  <div>
    <div class="gva-search-box">
      <el-form ref="elSearchFormRef" :inline="true" :model="searchInfo" class="demo-form-inline" :rules="searchRule"
        @keyup.enter="onSubmit">
        <el-form-item label="创建日期" prop="createdAt">
          <template #label>
            <span>
              创建日期
              <el-tooltip content="搜索范围是开始日期（包含）至结束日期（不包含）">
                <el-icon>
                  <QuestionFilled />
                </el-icon>
              </el-tooltip>
            </span>
          </template>
          <el-date-picker v-model="searchInfo.startCreatedAt" type="datetime" placeholder="开始日期"
            :disabled-date="time => searchInfo.endCreatedAt ? time.getTime() > searchInfo.endCreatedAt.getTime() : false"></el-date-picker>
          —
          <el-date-picker v-model="searchInfo.endCreatedAt" type="datetime" placeholder="结束日期"
            :disabled-date="time => searchInfo.startCreatedAt ? time.getTime() < searchInfo.startCreatedAt.getTime() : false"></el-date-picker>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" icon="search" @click="onSubmit">查询</el-button>
          <el-button icon="refresh" @click="onReset">重置</el-button>
        </el-form-item>
      </el-form>
    </div>
    <div class="gva-table-box">
      <div class="gva-btn-list">
        <el-button type="primary" icon="plus" @click="openDialog">新增</el-button>
        <el-popover v-model:visible="deleteVisible" :disabled="!multipleSelection.length" placement="top" width="160">
          <p>确定要删除吗？</p>
          <div style="text-align: right; margin-top: 8px;">
            <el-button type="primary" link @click="deleteVisible = false">取消</el-button>
            <el-button type="primary" @click="onDelete">确定</el-button>
          </div>
          <template #reference>
            <el-button icon="delete" style="margin-left: 10px;" :disabled="!multipleSelection.length"
              @click="deleteVisible = true">删除
            </el-button>
          </template>
        </el-popover>
      </div>
      <el-table ref="multipleTable" style="width: 100%" tooltip-effect="dark" :data="tableData" row-key="ID"
        @selection-change="handleSelectionChange">
        <el-table-column type="selection" width="55" />
        <el-table-column align="left" label="日期" width="180">
          <template #default="scope">{{ formatDate(scope.row.CreatedAt) }}</template>
        </el-table-column>

        <el-table-column align="left" label="内容标题" prop="title" width="120" />
        <el-table-column align="left" label="内容状态" prop="status" width="120" />
        <el-table-column align="left" label="内容摘要" prop="summary" width="120" show-overflow-tooltip />
        <el-table-column align="left" label="内容类别" prop="type" width="120" />
        <el-table-column align="left" label="评论数" prop="commentsNum" width="120" />
        <el-table-column align="left" label="创建时间" width="180">
          <template #default="scope">{{ formatDate(scope.row.createTime) }}</template>
        </el-table-column>
        <el-table-column align="left" label="踩数量" prop="downNum" width="120" />
        <el-table-column align="left" label="点赞数量" prop="likesNum" width="120" />
        <el-table-column align="left" label="分享数量" prop="shareNum" width="120" />
        <el-table-column align="left" label="内容顺序" prop="order" width="120" />
        <el-table-column align="left" label="是否评论" prop="allowComment" width="120" />
        <el-table-column align="left" label="修改时间" width="180">
          <template #default="scope">{{ formatDate(scope.row.updateTime) }}</template>
        </el-table-column>
        <el-table-column align="left" label="浏览数量" prop="viemNum" width="120" />
        <el-table-column align="left" label="操作" min-width="120">
          <template #default="scope">
            <el-button type="primary" link icon="edit" class="table-button" @click="updateTblContentFunc(scope.row)">变更
            </el-button>
            <el-button type="primary" link icon="delete" @click="deleteRow(scope.row)">删除</el-button>
          </template>
        </el-table-column>
      </el-table>
      <div class="gva-pagination">
        <el-pagination layout="total, sizes, prev, pager, next, jumper" :current-page="page" :page-size="pageSize"
          :page-sizes="[10, 30, 50, 100]" :total="total" @current-change="handleCurrentChange"
          @size-change="handleSizeChange" />
      </div>
    </div>
    <el-dialog v-model="dialogFormVisible" :before-close="closeDialog" style="width: 100%;height: 100%;" top="0"
      :title="type === 'create' ? '添加' : '修改'" destroy-on-close>
      <el-scrollbar height="98%">
        <el-form :model="formData" label-position="right" ref="elFormRef" :rules="rule" style="width: 100%;"
          label-width="80px">
          <el-form-item label="内容标题:" prop="title">
            <el-input v-model="formData.title" :clearable="true" placeholder="请输入内容标题" />
          </el-form-item>
          <el-form-item label="图片路径:" prop="img">
            <upload-common @on-success="setImg" />
            <CustomPic pic-type="file" :pic-src="formData.img" v-if="formData.img" preview />
          </el-form-item>
          <el-form-item label="内容摘要:" prop="summary">
            <el-input v-model="formData.summary" :clearable="true" :row="5" type="textarea" placeholder="请输入内容摘要" />
          </el-form-item>

          <el-form-item label="内容文字:" prop="content">
            <div>
              <label class="font-bold text-blue-500">
                <input type="radio" v-model="formData.editType" value="basic" />富文本
              </label>
              <label class="font-bold text-blue-500 ml-2">
                <input type="radio" v-model="formData.editType" value="md" />Markdown
              </label>
              <div v-if="formData.editType === 'basic'">
                <BasicEditor @changeValue="change" :html="formData.content" />
              </div>
              <div v-else-if="formData.editType === 'md'">
                <MdEditor v-model="formData.content"  @onUploadImg="onUploadImg" />
              </div>
            </div>


          </el-form-item>
          <el-form-item label="内容标签:" prop="type">
            <el-select v-model="formData.tags" :clearable="true" placeholder="请选择内容标签" size="medium" multiple
              :style="{ width: '45%' }">
              <el-option v-for="item in tags" :key="item.ID" :label="item.name" :value="item.ID" />
            </el-select>
          </el-form-item>
          <el-form-item label="内容类别:" prop="type">
            <el-select v-model="formData.type" :clearable="true" placeholder="请选择内容类别" size="medium">
              <el-option v-for="item in mates" :key="item.name" :label="item.name" :value="item.name" />
            </el-select>
          </el-form-item>
          <el-form-item label="文章集:" prop="type">
            <el-select v-model="formData.blogSet" :clearable="true" placeholder="请选择文章集" size="medium">
              <el-option v-for="item in sets" :key="item.name" :label="item.name" :value="item.name" />
            </el-select>
          </el-form-item>
          <el-form-item label="文章子集:" prop="type">
            <el-select v-model="formData.subset" :clearable="true" placeholder="请选择文章子集" size="medium">
              <el-option v-for="item in subsets" :key="item.name" :label="item.name" :value="item.name" />
            </el-select>
            <span style="color: red;margin-left:4px;">子集按文章创建时间正序显示</span>
          </el-form-item>
          <el-form-item label="内容状态:" prop="status">
            <el-select v-model="formData.status" :clearable="true" placeholder="请选择内容状态" size="medium">
              <el-option v-for="item in options" :key="item.value" :label="item.label" :value="item.value" />
            </el-select>
          </el-form-item>
          <el-form-item label="内容顺序:" prop="order">
            <el-input-number v-model="formData.order" :clearable="true" :min="1" :max="1000" />
          </el-form-item>
          <el-form-item label="保护密码:" prop="password">
            <el-input v-model="formData.password" :clearable="true" placeholder="请输入保护密码" />
          </el-form-item>
          <el-form-item label="是否评论:" prop="allowComment">
            <el-select v-model="formData.allowComment" :clearable="true" placeholder="请选择是否评论" size="medium">
              <el-option v-for="item in options" :key="item.value" :label="item.label" :value="item.value" />
            </el-select>
          </el-form-item>
        </el-form>
      </el-scrollbar>
      <template #footer>
        <div class="dialog-footer">
          <el-button @click="closeDialog">取 消</el-button>
          <el-button type="primary" @click="enterDialog">确 定</el-button>
        </div>
      </template>
    </el-dialog>

    <el-dialog v-model="detailShow" style="width: 800px" lock-scroll :before-close="closeDetailShow" title="查看详情"
      destroy-on-close>
      <el-scrollbar height="550px">
        <el-descriptions column="1" border>
          <el-descriptions-item label="内容标题">
            {{ formData.title }}
          </el-descriptions-item>
          <el-descriptions-item label="内容类别">
            {{ formData.type }}
          </el-descriptions-item>
          <el-descriptions-item label="内容状态">
            {{ formData.status }}
          </el-descriptions-item>
          <el-descriptions-item label="内容摘要">
            {{ formData.summary }}
          </el-descriptions-item>
          <el-descriptions-item label="内容文字">
            {{ formData.content }}
          </el-descriptions-item>
          <el-descriptions-item label="作者ID">
            {{ formData.authorId }}
          </el-descriptions-item>
          <el-descriptions-item label="评论数">
            {{ formData.commentsNum }}
          </el-descriptions-item>
          <el-descriptions-item label="图片路径">
            {{ formData.img }}
          </el-descriptions-item>
          <el-descriptions-item label="创建时间">
            {{ formatDate(formData.createTime) }}
          </el-descriptions-item>
          <el-descriptions-item label="内容顺序">
            {{ formData.order }}
          </el-descriptions-item>
          <el-descriptions-item label="踩数量">
            {{ formData.downNum }}
          </el-descriptions-item>
          <el-descriptions-item label="点赞数量">
            {{ formData.likesNum }}
          </el-descriptions-item>
          <el-descriptions-item label="保护密码">
            {{ formData.password }}
          </el-descriptions-item>
          <el-descriptions-item label="分享数量">
            {{ formData.shareNum }}
          </el-descriptions-item>
          <el-descriptions-item label="修改时间">
            {{ formatDate(formData.updateTime) }}
          </el-descriptions-item>
          <el-descriptions-item label="浏览数量">
            {{ formData.viemNum }}
          </el-descriptions-item>
          <el-descriptions-item label="是否评论">
            {{ formData.allowComment }}
          </el-descriptions-item>
        </el-descriptions>
      </el-scrollbar>
    </el-dialog>
  </div>
</template>

<script setup>
import {
  createTblContent,
  deleteTblContent,
  deleteTblContentByIds,
  updateTblContent,
  findTblContent,
  getTblContentList
} from '@/api/tblContent'
import {
  getTblMetaListAll
} from '@/api/tblMeta'
import { MdEditor } from 'md-editor-v3';
import 'md-editor-v3/lib/style.css';
// 全量引入格式化工具 请按需保留
import { getDictFunc, formatDate, formatBoolean, filterDict, ReturnArrImg, onDownloadFile } from '@/utils/format'
import { ElMessage, ElMessageBox } from 'element-plus'
import { ref, reactive, computed } from 'vue'
import UploadCommon from '@/components/upload/common.vue'
import CustomPic from '@/components/customPic/index.vue'
import BasicEditor from '@/components/editor/BasicEditor.vue';
import { useUserStore } from '@/pinia/modules/user'
import axios from 'axios'

defineOptions({
  name: 'TblContent'
})

// 自动化生成的字典（可能为空）以及字段
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
  tags: [],
  editType: 'basic',
})
const options = [
  {
    value: '允许',
    label: '允许',
  },
  {
    value: '禁止',
    label: '禁止',
  }
]


// 验证规则
const rule = reactive({})

const searchRule = reactive({
  createdAt: [
    {
      validator: (rule, value, callback) => {
        if (searchInfo.value.startCreatedAt && !searchInfo.value.endCreatedAt) {
          callback(new Error('请填写结束日期'))
        } else if (!searchInfo.value.startCreatedAt && searchInfo.value.endCreatedAt) {
          callback(new Error('请填写开始日期'))
        } else if (searchInfo.value.startCreatedAt && searchInfo.value.endCreatedAt && (searchInfo.value.startCreatedAt.getTime() === searchInfo.value.endCreatedAt.getTime() || searchInfo.value.startCreatedAt.getTime() > searchInfo.value.endCreatedAt.getTime())) {
          callback(new Error('开始日期应当早于结束日期'))
        } else {
          callback()
        }
      }, trigger: 'change'
    }
  ],
})

const elFormRef = ref()
const elSearchFormRef = ref()

// =========== 表格控制部分 ===========
const page = ref(1)
const total = ref(0)
const pageSize = ref(10)
const tableData = ref([])
const searchInfo = ref({})
const mates = ref([])
const tags = ref([])
const sets = ref([])
const subsets = ref([])
// 重置
const onReset = () => {
  searchInfo.value = {}
  getTableData()
}

const setImg = (val) => {
  formData.value.img = val
}
// 搜索
const onSubmit = () => {
  elSearchFormRef.value?.validate(async (valid) => {
    if (!valid) return
    page.value = 1
    pageSize.value = 10
    getTableData()
  })
}

// 分页
const handleSizeChange = (val) => {
  pageSize.value = val
  getTableData()
}

// 修改页面容量
const handleCurrentChange = (val) => {
  page.value = val
  getTableData()
}

// 查询
const getTableData = async () => {
  const table = await getTblContentList({ page: page.value, pageSize: pageSize.value, ...searchInfo.value })
  if (table.code === 0) {
    tableData.value = table.data.list
    total.value = table.data.total
    page.value = table.data.page
    pageSize.value = table.data.pageSize
  }
}

// 获取所有的菜单列表
const getTableDataAll = async () => {
  const table = await getTblMetaListAll({ mateType: "菜单" })
  if (table.code === 0) {
    mates.value = table.data.list
  }
}


// 获取所有的标签列表
const getTableDataTags = async () => {
  const table = await getTblMetaListAll({ mateType: "标签" })
  if (table.code === 0) {
    tags.value = table.data.list
  }
}

// 获取所有文章集
const getTableDataSets = async () => {
  const table = await getTblMetaListAll({ mateType: "文章集" })
  if (table.code === 0) {
    sets.value = table.data.list
  }
}

// 获取所有的文章子集
const getTableDataSubSets = async () => {
  const table = await getTblMetaListAll({ mateType: "文章子集" })
  if (table.code === 0) {
    subsets.value = table.data.list
  }
}
getTableData()
getTableDataSets()
getTableDataSubSets()
getTableDataAll()
getTableDataTags()

// ============== 表格控制部分结束 ===============

// 获取需要的字典 可能为空 按需保留
const setOptions = async () => {
}

// 获取需要的字典 可能为空 按需保留
setOptions()


// 多选数据
const multipleSelection = ref([])
// 多选
const handleSelectionChange = (val) => {
  multipleSelection.value = val
}

// 删除行
const deleteRow = (row) => {
  ElMessageBox.confirm('确定要删除吗?', '提示', {
    confirmButtonText: '确定',
    cancelButtonText: '取消',
    type: 'warning'
  }).then(() => {
    deleteTblContentFunc(row)
  })
}


// 批量删除控制标记
const deleteVisible = ref(false)

// 多选删除
const onDelete = async () => {
  const ids = []
  if (multipleSelection.value.length === 0) {
    ElMessage({
      type: 'warning',
      message: '请选择要删除的数据'
    })
    return
  }
  multipleSelection.value &&
    multipleSelection.value.map(item => {
      ids.push(item.ID)
    })
  const res = await deleteTblContentByIds({ ids })
  if (res.code === 0) {
    ElMessage({
      type: 'success',
      message: '删除成功'
    })
    if (tableData.value.length === ids.length && page.value > 1) {
      page.value--
    }
    deleteVisible.value = false
    getTableData()
  }
}

// 行为控制标记（弹窗内部需要增还是改）
const type = ref('')

// 更新行
const updateTblContentFunc = async (row) => {
  const res = await findTblContent({ ID: row.ID })
  type.value = 'update'
  if (res.code === 0) {
    formData.value = res.data.retblContent
    dialogFormVisible.value = true
  }
}


// 删除行
const deleteTblContentFunc = async (row) => {
  const res = await deleteTblContent({ ID: row.ID })
  if (res.code === 0) {
    ElMessage({
      type: 'success',
      message: '删除成功'
    })
    if (tableData.value.length === 1 && page.value > 1) {
      page.value--
    }
    getTableData()
  }
}

// 弹窗控制标记
const dialogFormVisible = ref(false)


// 查看详情控制标记
const detailShow = ref(false)


// 打开详情弹窗
const openDetailShow = () => {
  detailShow.value = true
}


// 打开详情
const getDetails = async (row) => {
  // 打开弹窗
  const res = await findTblContent({ ID: row.ID })
  if (res.code === 0) {
    formData.value = res.data.retblContent
    openDetailShow()
  }
}


// 关闭详情弹窗
const closeDetailShow = () => {
  detailShow.value = false
  formData.value = {
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
    tags: []
  }
}


// 打开弹窗
const openDialog = () => {
  type.value = 'create'
  dialogFormVisible.value = true
}

// 关闭弹窗
const closeDialog = () => {
  dialogFormVisible.value = false
  formData.value = {
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
    tags: [],
    editType: ''
  }
}
// 弹窗确定
const enterDialog = async () => {
  elFormRef.value?.validate(async (valid) => {
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
      closeDialog()
      getTableData()
    }
  })
}

//捕获富文本框内容变化并赋值
const change = value => {
  formData.value.content = value;
};

const selectedEditorComponent = computed(() => {
  return formData.value.editType === 'basic' ? BasicEditor : MdEditor;
});
const path = ref(import.meta.env.VITE_BASE_API)
const userStore = useUserStore()
const onUploadImg = async (files, callback) => {
  const res = await Promise.all(
    files.map((file) => {
      return new Promise((rev, rej) => {
        const form = new FormData();
        form.append('file', file);
        axios
          .post(path.value + "/fileUploadAndDownload/upload", form, {
            headers: {
              'Content-Type': 'multipart/form-data',
              'x-token': userStore.token
            }
          })
          .then((res) => rev(res))
          .catch((error) => rej(error));
      });
    })
  );

  callback(res.map((item) => {
    return path.value +item.data.data.file.url;
  }));
};
</script>

<style></style>
