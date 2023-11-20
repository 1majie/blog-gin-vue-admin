<template>
  <div>
    <div style="border: 1px solid #ccc; margin-top: 10px">
      <Toolbar :editor="editorRef" :defaultConfig="toolbarConfig" :mode="mode" style="border-bottom: 1px solid #ccc" />
      <Editor :defaultConfig="editorConfig" :mode="mode" v-model="valueHtml" style="height: 400px; overflow-y: hidden"
        @onCreated="handleCreated" @onChange="handleChange" @onDestroyed="handleDestroyed" @onFocus="handleFocus"
        @onBlur="handleBlur" @customAlert="customAlert" @customPaste="customPaste" />
    </div>
  </div>
</template>

<script>
import '@wangeditor/editor/dist/css/style.css';
import { onBeforeUnmount, ref, shallowRef, onMounted, watch } from 'vue';
import { useUserStore } from '@/pinia/modules/user'
import { Editor, Toolbar } from '@wangeditor/editor-for-vue';
const path = ref(import.meta.env.VITE_BASE_API)
const userStore = useUserStore()
export default {
  components: { Editor, Toolbar },
  // 将父组件的值传递给子组件
  props: ['html'],
  setup(props, { emit }) {

    // 编辑器实例，必须用 shallowRef，重要！
    const editorRef = shallowRef();

    // 内容 HTML
    const valueHtml = ref(props.html)
    // 监听父组件的 html 变化
    watch(props, (newValue, oldValue) => {
      valueHtml.value = newValue.html
    })
    // 模拟 ajax 异步获取内容
    onMounted(() => {

    });

    const toolbarConfig = {};
    const editorConfig = {
      MENU_CONF: {},
      placeholder: '请输入内容...'
    };

    editorConfig.MENU_CONF['uploadImage'] = {
      server: path.value + "/fileUploadAndDownload/upload",
      // form-data fieldName ，默认值 'wangeditor-uploaded-image'
      fieldName: 'file',

      // 单个文件的最大体积限制，默认为 2M
      maxFileSize: 1 * 1024 * 1024, // 1M

      // 最多可上传几个文件，默认为 100
      maxNumberOfFiles: 10,

      // 选择文件时的类型限制，默认为 ['image/*'] 。如不想限制，则设置为 []
      allowedFileTypes: ['image/*'],

      // 自定义增加 http  header
      headers: {
        'x-token': userStore.token
      },

      // 跨域是否传递 cookie ，默认为 false
      withCredentials: true,

      // 超时时间，默认为 10 秒
      timeout: 5 * 1000, // 5 秒
      // form-data fieldName ，默认值 'wangeditor-uploaded-image'

      // 上传之前触发
      onBeforeUpload(file) {    // JS 语法
        // file 选中的文件，格式如 { key: file }
        return file

        // 可以 return
        // 1. return file 或者 new 一个 file ，接下来将上传
        // 2. return false ，不上传这个 file
      },

      // 上传进度的回调函数
      onProgress(progress) {       // JS 语法
        // progress 是 0-100 的数字
        console.log('progress', progress)
      },

      // 单个文件上传成功之后
      onSuccess(file, res) {          // JS 语法
        console.log(`${file.name} 上传成功`, res)
      },

      // 单个文件上传失败
      onFailed(file, res) {           // JS 语法
        console.log(`${file.name} 上传失败`, res)
      },

      // 上传错误，或者触发 timeout 超时
      onError(file, err, res) {               // JS 语法
        console.log(`${file.name} 上传出错`, err, res)
      },
      customInsert(res, insertFn) {
        console.log(res)               // JS 语法
        // res 即服务端的返回结果
        // 从 res 中找到 url alt href ，然后插入图片
        if (res.code > 0) {
          console.log(res.msg
          );
        } else {
          insertFn(path.value + "/" + res.data.file.url, res.data.file.name, path.value + "/" + res.data.file.url)
        }

      },
    }
    editorConfig.MENU_CONF['uploadVideo'] = {
      server: path.value + "/fileUploadAndDownload/upload",
      // form-data fieldName ，默认值 'wangeditor-uploaded-video'
      fieldName: 'file',

      // 单个文件的最大体积限制，默认为 10M
      maxFileSize: 5 * 1024 * 1024 * 1024, // 5M

      // 最多可上传几个文件，默认为 5
      maxNumberOfFiles: 3,

      // 选择文件时的类型限制，默认为 ['video/*'] 。如不想限制，则设置为 []
      allowedFileTypes: ['video/*'],

      // 自定义增加 http  header
      headers: {
        'x-token': userStore.token
      },

      // 跨域是否传递 cookie ，默认为 false
      withCredentials: true,

      // 超时时间，默认为 30 秒
      timeout: 15 * 1000, // 15 秒

      // 视频不支持 base64 格式插入
      // 上传之前触发
      onBeforeUpload(file) {      // JS 语法
        // file 选中的文件，格式如 { key: file }
        return file

        // 可以 return
        // 1. return file 或者 new 一个 file ，接下来将上传
        // 2. return false ，不上传这个 file
      },

      // 上传进度的回调函数
      onProgress(progress) {       // JS 语法
        // progress 是 0-100 的数字
        console.log('progress', progress)
      },

      // 单个文件上传成功之后
      onSuccess(file, res) {          // JS 语法
        console.log(`${file.name} 上传成功`, res)
      },

      // 单个文件上传失败
      onFailed(file, res) {          // JS 语法
        console.log(`${file.name} 上传失败`, res)
      },

      // 上传错误，或者触发 timeout 超时
      onError(file, err, res) {               // JS 语法
        console.log(`${file.name} 上传出错`, err, res)
      },
      customInsert(res, insertFn) {                  // JS 语法
        // res 即服务端的返回结果

        // 从 res 中找到 url poster ，然后插入视频
        console.log(res)               // JS 语法
        // res 即服务端的返回结果
        // 从 res 中找到 url alt href ，然后插入图片
        if (res.code > 0) {
          console.log(res.msg
          );
        } else {
          insertFn(path.value + "/" + res.data.file.url, res.data.file.name)
          // insertFn(path.value + "/" + res.data.file.url, res.data.file.name, path.value + "/" + res.data.file.url)
        }

      },
    }

    // 组件销毁时，也及时销毁编辑器，重要！
    onBeforeUnmount(() => {
      const editor = editorRef.value;
      if (editor == null) return;

      editor.destroy();
    });

    // 编辑器回调函数
    const handleCreated = (editor) => {
      console.log('created', editor);
      editorRef.value = editor; // 记录 editor 实例，重要！
    };
    const handleChange = (editor) => {
      emit('changeValue', editor.getHtml())
    };
    const handleDestroyed = (editor) => {
      console.log('destroyed', editor);
    };
    const handleFocus = (editor) => {
      console.log('focus', editor);
    };
    const handleBlur = (editor) => {
      console.log('blur', editor);
    };
    const customAlert = (info, type) => {
      alert(`【自定义提示】${type} - ${info}`);
    };
    const customPaste = (editor, event, callback) => {
      console.log('ClipboardEvent 粘贴事件对象', event);
      // 自定义插入内容
      // editor.insertText('xxx');

      // 返回值（注意，vue 事件的返回值，不能用 return）
      // callback(false); // 返回 false ，阻止默认粘贴行为
      callback(true) // 返回 true ，继续默认的粘贴行为
    };

    const insertText = () => {
      const editor = editorRef.value;
      if (editor == null) return;

      editor.insertText('hello world');
    };

    const printHtml = () => {
      const editor = editorRef.value;
      if (editor == null) return;
      console.log(editor.getHtml());
    };

    const disable = () => {
      const editor = editorRef.value;
      if (editor == null) return;
      editor.disable()
    };

    return {
      editorRef,
      mode: 'default',
      valueHtml,
      toolbarConfig,
      editorConfig,
      handleCreated,
      handleChange,
      handleDestroyed,
      handleFocus,
      handleBlur,
      customAlert,
      customPaste,
      insertText,
      printHtml,
      disable
    };
  },
};
</script>
