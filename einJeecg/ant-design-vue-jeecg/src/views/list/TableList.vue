<template>
  <a-card :bordered="false">
    <div class="table-page-search-wrapper">
      <a-form layout="inline">
        <a-row :gutter="48">
          <a-col :md="8" :sm="24">
            <a-form-item label="商品名" >
              <a-input  v-model="queryParam.name" placeholder="请输入" style="width: 100%"/>
            </a-form-item>
          </a-col>
          <a-col :md="8" :sm="24">
            <a-form-item label="状态" >
              <a-select  v-model="queryParam.status" placeholder="请选择" default-value="0">
                <a-select-option value="0">禁用</a-select-option>
                <a-select-option value="1">正常</a-select-option>
              </a-select>
            </a-form-item>
          </a-col>
          <template v-if="advanced">
            <a-col :md="8" :sm="24">
              <a-form-item label="价格" >
                <a-input-number  v-model="queryParam.price" style="width: 100%"/>
              </a-form-item>
            </a-col>
          </template>
          <a-col :md="!advanced && 8 || 24" :sm="24">
            <span class="table-page-search-submitButtons" :style="advanced && { float: 'right', overflow: 'hidden' } || {} ">
              <a-button type="primary" @click="searchList">查询</a-button>
              <a-button style="margin-left: 8px" @click="resetSearchForm">重置</a-button>
              <a @click="toggleAdvanced" style="margin-left: 8px">
                {{ advanced ? '收起' : '展开' }}
                <a-icon :type="advanced ? 'up' : 'down'"/>
              </a>
            </span>
          </a-col>
        </a-row>
      </a-form>
    </div>

    <div class="table-operator">
      <a-button type="primary" icon="plus" @click="() => this.handleModalVisible(true)">新建</a-button>
      <a-dropdown v-if="selectedRowKeys.length > 0">
        <a-menu slot="overlay">
          <a-menu-item key="1"><a-icon type="delete" />删除</a-menu-item>
          <!-- lock | unlock -->
          <a-menu-item key="2"><a-icon type="lock" />锁定</a-menu-item>
        </a-menu>
        <a-button style="margin-left: 8px">
          批量操作 <a-icon type="down" />
        </a-button>
      </a-dropdown>
    </div>

    <s-table
      ref="table"
      size="default"
      :columns="columns"
      :data="loadData"
      :showAlertInfo="true"
      @onSelect="onChange"
    >
      <template slot="avatarslot" slot-scope="text, record, index">
        <div class="anty-img-wrap">
          <a-avatar shape="square" :src="getAvatarView(record.avatar)" icon="user"/>
        </div>
      </template>
      <span slot="action" slot-scope="text, record">
        <a @click="handleEdit(record)">编辑</a>
        <a-divider type="vertical" />
         <a @click="batchDel(record)">删除</a>
        <a-divider type="vertical" />
        <a @click="view(record)">详情</a>
      </span>
    </s-table>
<!--详情-->
    <a-modal
      title="详情"
      :width="800"
      v-model="viewVisible"
    >
      <a-form :autoFormCreate="(form)=>{this.viewForm = form}">
        <a-form-item
          :labelCol="labelCol"
          :wrapperCol="wrapperCol"
          label="商品名称"
          hasFeedback
        >
          <a-input placeholder="商品名称" v-model="mdl.name" id="name" readonly/>
        </a-form-item>
        <a-input id="id" v-model="mdl.id" hidden></a-input>
        <a-form-item label="图片" :labelCol="labelCol" :wrapperCol="wrapperCol" >
          <a-upload
            name="file"
            :multiple="true"
            action="/jeecg-boot/sys/common/upload"
            :headers="headers"
            :defaultFileList="defaultFileList"
            @change="handleChange"
            @preview="handlePreview">
          </a-upload>
        </a-form-item>
        <a-form-item
          :labelCol="labelCol"
          :wrapperCol="wrapperCol"
          label="状态"
          hasFeedback
        >
          <a-select defaultValue="1" v-model="mdl.status" id="status" readonly>
            <a-select-option value="1">正常</a-select-option>
            <a-select-option value="0">禁用</a-select-option>
          </a-select>
        </a-form-item>

        <a-form-item
          :labelCol="labelCol"
          :wrapperCol="wrapperCol"
          label="描述"
          hasFeedback
          help="请填写一段描述"
        >
          <a-textarea :rows="5" v-model="mdl.description" placeholder="..." id="description" readonly/>
        </a-form-item>

        <a-form-item
          :labelCol="labelCol"
          :wrapperCol="wrapperCol"
          label="价格"
          hasFeedback
        >
          <a-input placeholder="价格"  id="price" readonly/>
        </a-form-item>

      </a-form>
    </a-modal>
<!--编辑-->
    <a-modal
    title="编辑"
    :width="800"
    v-model="visible"
    @ok="handleOk"
  >
    <a-form :autoFormCreate="(form)=>{this.editForm = form}">
      <a-form-item
        :labelCol="labelCol"
        :wrapperCol="wrapperCol"
        label="商品名称"
        hasFeedback
        validateStatus="success"
        getFieldDecorator="[]"
      >
        <a-input placeholder="商品名称" v-model="mdl.name" id="name" name="name" v-decorator="[ 'name', validatorRules.name]"/>
      </a-form-item>
      <a-input id="id" v-model="mdl.id" hidden></a-input>
      <a-form-item label="图片" :labelCol="labelCol" :wrapperCol="wrapperCol" >
        <a-upload
          name="file"
          :multiple="true"
          action="/jeecg-boot/sys/common/upload"
          :headers="headers"
          :defaultFileList="defaultFileList"
          @change="handleChange"
          @preview="handlePreview">
          <a-button>
            <a-icon type="upload" /> Click to Upload
          </a-button>
        </a-upload>
      </a-form-item>
      <a-form-item
        :labelCol="labelCol"
        :wrapperCol="wrapperCol"
        label="状态"
        hasFeedback
        validateStatus="success"
      >
        <a-select defaultValue="1" v-model="mdl.status" id="status" name= "status" v-decorator="[ 'status', validatorRules.status]" >
          <a-select-option value="1">正常</a-select-option>
          <a-select-option value="0">禁用</a-select-option>
        </a-select>
      </a-form-item>
      <a-form-item
        :labelCol="labelCol"
        :wrapperCol="wrapperCol"
        label="描述"
        hasFeedback
        help="请填写一段描述"
        validateStatus="success"
      >
        <a-textarea :rows="5" v-model="mdl.description" placeholder="..." id="description" name="description" v-decorator="[ 'description', validatorRules.description]"/>
      </a-form-item>
      <a-form-item
        :labelCol="labelCol"
        :wrapperCol="wrapperCol"
        label="价格"
        hasFeedback
        validateStatus="success"
      >
        <a-input placeholder="价格"  id="price" name="price"v-decorator="[ 'price', validatorRules.price]" />
      </a-form-item>
    </a-form>
  </a-modal>
//添加
    <a-modal title="添加" destroyOnClose :visible="visibleCreateModal" v-has="'goods:add'" @ok="handleCreateModalOk" @cancel="handleCreateModalCancel">
      <!---->
      <a-form style="margin-top: 8px" :autoFormCreate="(form)=>{this.createForm = form}">
        <a-form-item :labelCol="{ span: 5 }" :wrapperCol="{ span: 15 }" label="商品名" fieldDecoratorId="name" :fieldDecoratorOptions="{rules: [{ required: true, message: '请输入商品名！' }]}">
          <a-input placeholder="请输入" />
        </a-form-item>
        <a-form-item label="图片" :labelCol="labelCol" :wrapperCol="wrapperCol">
          <a-upload name="img" :multiple="true" action="/jeecg-boot/sys/common/upload" :headers="headers" @change="handleChange">
            <a-button>
              <a-icon type="upload" /> Click to Upload
            </a-button>
          </a-upload>
        </a-form-item>
        <a-form-item :labelCol="{ span: 5 }" :wrapperCol="{ span: 15 }" label="价格（元）" fieldDecoratorId="price" :fieldDecoratorOptions="{rules: [{ required: true, message: '请上传图片！'}]}">
          <a-input placeholder="请输入" />
        </a-form-item>
        <a-form-item :labelCol="{ span: 5 }" :wrapperCol="{ span: 15 }"
          label="状态"
          hasFeedback
                     fieldDecoratorId="status"
                     :fieldDecoratorOptions="{rules: [{ required: true, message: '请选择状态！' }]}"
        >
          <a-select defaultValue="1" >
            <a-select-option value="1">正常</a-select-option>
            <a-select-option value="0">禁用</a-select-option>
          </a-select>
        </a-form-item>
        <a-form-item :labelCol="labelCol" :wrapperCol="{span:15}" label="描述" fieldDecoratorId="description" hasFeedback help="请填写一段描述":fieldDecoratorOptions="{rules: [{ required: true, message: '请输入至少五个字符的规则描述！' }]}">
          <a-textarea :rows="5"  placeholder="..." />
        </a-form-item>
      </a-form>
    </a-modal>

  </a-card>
</template>

<script>
  import Vue from "vue";
  import STable from '@/components/table/'
  import ATextarea from "ant-design-vue/es/input/TextArea"
  import AInput from "ant-design-vue/es/input/Input"
  import moment from "moment"
  import axios from 'axios';
  import { getRoleList, getGoodsList } from '@/api/manage';
  import {ACCESS_TOKEN} from "@/store/mutation-types"

  export default {
    name: "TableList",
    components: {
      AInput,
      ATextarea,
      STable
    },
    data () {
      return {
        visibleCreateModal:false,
        visible: false,
        viewVisible:false,
        labelCol: {
          xs: { span: 24 },
          sm: { span: 5 },
        },
        wrapperCol: {
          xs: { span: 24 },
          sm: { span: 12 },
        },
        form: null,
        mdl: {},
        validatorRules:{
          name:{
            rules: [{
              required: true, message: '请输入商品名称!'
            }]
          },
          status:{
            rules: [{
              required: true,
              message: '请选择状态!'
            }],
          },
          description:{
            rules: [{
              required: true, message: '请输入描述!',
            }],
          },
          price:{rules: [{ required: true, message: '请输入用户名称!' }]},
        },
        // 高级搜索 展开/关闭
        advanced: true,
        // 查询参数
        queryParam: {},
        //图片
        defaultFileList:[],
        previewVisible: false,
        previewImage: '',
        // 表头
        columns: [
          {
            title: '商品名',
            dataIndex: 'name'
          },
          {
            title: '描述',
            dataIndex: 'description'
          },
          {
            title: '状态',
            dataIndex: 'status',
            needTotal: true
          },
          {
            title: '价格',
            dataIndex: 'price',
          },
          {
            title: '更新时间',
            dataIndex: 'updateTime',
            sorter: true
          },
          {
            table: '操作',
            dataIndex: '',
            width: '150px',
            scopedSlots: { customRender: 'action' },
          }
        ],
        // 加载数据方法 必须为 Promise 对象
        loadData: parameter => {
          return getGoodsList(Object.assign(parameter, this.queryParam))
            .then(res => {
              return res.result;
            })
        },
        selectedRowKeys: [],
        selectedRows: [],
        url: {
          fileUpload: window._CONFIG['domianURL']+"/sys/common/upload",
          imgerver: window._CONFIG['domianURL']+"/sys/common/view",
          delete:window._CONFIG['domianURL']+ "/test/goods/delete",
        },
      }
    },
    created () {
      getRoleList({ t: new Date()});
      const token=Vue.ls.get(ACCESS_TOKEN);
      this.headers={"x-Access-Token":token};
    },
    methods: {
      handleCancel () {
        alert("捡来了");
        this.previewVisible = false
      },
      handlePreview (file) {
        this.previewImage = file.url || file.thumbUrl
        this.previewVisible = true
      },
      handleChange(info) {
        if (info.file.status !== 'uploading') {
          console.log(info.file, info.fileList);
        }
        if (info.file.status === 'done') {
          this.$message.success(`${info.file.name} file uploaded successfully`);
          var list=info.fileList;
          if(info.fileList.length>0){
            for(var i=0;i<info.fileList.length;i++){
              // var simplefile={
              //   uid:info.fileList[i].uid,
              //   name:info.fileList[i].name,
              //   status:info.fileList[i].status,
              //   url:info.fileList[i].response.message
              // }
              list[i].thumbUrl="";
            }
          }
          this.img=JSON.stringify(info.fileList);
          this.defaultFileList=info.fileList;
        } else if (info.file.status === 'error') {
          this.$message.error(`${info.file.name} file upload failed.`);
        }
      },
      handleEdit (record) {
        console.log(this.defaultFileList);
        this.mdl = Object.assign({}, record);
        //this.defaultFileList=JSON.parse(record.img);
        this.visible = true;
      },
      handleOk () {
        this.editForm.validateFields((err, fieldsValue) => {
          if (err) {
            return;
          }
          debugger;
          var that=this;
          const name=that.editForm.getFieldDecorator("name");
          const status=that.editForm.getFieldDecorator("status");
          const price=Number(that.editForm.getFieldValue("price"));
            const description = that.editForm.getFieldValue('description');
            const img=that.img;
            const id=that.editForm.getFieldValue("id");
            axios.post('/jeecg-boot/test/goods/edit', {
              description: description,
            name:name,
            price:price,
            status:status,
            img:img,
            id:id
          }).then((res) => {
            console.log(res);
            that.createForm.resetFields();
            that.visibleCreateModal = false;
            that.loadData(that.queryParam);
            // this.defaultFileList=[];
            // this.img="";
            that.$refs.table.refresh();
          });
        });
      },
      //查看
      view(record){
        this.mdl = Object.assign({}, record);
        this.viewVisible = true;
      },
      //添加逻辑
      handleModalVisible(isVisible) {
        this.visibleCreateModal = isVisible;
      },

      handleCreateModalOk() {
        this.createForm.validateFields((err, fieldsValue) => {
          if (err) {
            return;
          }
          var that=this;
          const name=this.createForm.getFieldValue("name");
          const status=this.createForm.getFieldValue("status");
          const price=Number(this.createForm.getFieldValue("price"));
          const description = this.createForm.getFieldValue('description');
          const img=this.img;
          console.log(img);
          axios.post('/jeecg-boot/test/goods/add', {
            description: description,
            name:name,
            price:price,
            status:status,
            img:img
          }).then((res) => {
            console.log(res);
            that.createForm.resetFields();
            that.visibleCreateModal = false;
            that.loadData(that.queryParam);
           // this.defaultFileList=[];
           // this.img="";
            that.$refs.table.refresh();
          });
        });
      },
      handleCreateModalCancel() {
        this.visibleCreateModal = false;
      },
      onChange (row) {
        this.selectedRowKeys = row.selectedRowKeys
        this.selectedRows = row.selectedRows
        console.log(this.$refs.table)
      },
      toggleAdvanced () {
        this.advanced = !this.advanced
      },
      searchList(){
        this.loadData(this.queryParam);
        this.$refs.table.refresh();
      },
      resetSearchForm () {
        this.queryParam = {
          date: moment(new Date())
        }
      },
      batchDel (record) {
      alert("hahha");
         var that = this;
          this.$confirm({
            title: "确认删除",
            content: "是否删除选中数据?",
            onOk: function () {
               axios({
                url: window._CONFIG['domianURL']+ "/test/goods/delete",
                method: 'delete',
                params:{id:record.id}
              }).then((res) => {
                if (res.data.success) {
                  that.$message.success(res.data.message);
                  that.loadData(that.queryParam);
                  that.$refs.table.refresh();
                } else {
                  that.$message.warning(res.data.message);
                }
              });
            }
          });
      },
    },
      computed:{
        uploadAction:function () {
          return this.url.fileUpload;
        }
      },

    watch: {
      /*
      'selectedRows': function (selectedRows) {
        this.needTotalList = this.needTotalList.map(item => {
          return {
            ...item,
            total: selectedRows.reduce( (sum, val) => {
              return sum + val[item.dataIndex]
            }, 0)
          }
        })
      }
      */
    }
  }
</script>
<style scoped>
  .avatar-uploader > .ant-upload {
    width:104px;
    height:104px;
  }
  .ant-upload-select-picture-card i {
    font-size: 49px;
    color: #999;
  }

  .ant-upload-select-picture-card .ant-upload-text {
    margin-top: 8px;
    color: #666;
  }

  .ant-table-tbody .ant-table-row td{
    padding-top:10px;
    padding-bottom:10px;
  }

  .drawer-bootom-button {
    position: absolute;
    bottom: -8px;
    width: 100%;
    border-top: 1px solid #e8e8e8;
    padding: 10px 16px;
    text-align: right;
    left: 0;
    background: #fff;
    border-radius: 0 0 2px 2px;
  }
</style>