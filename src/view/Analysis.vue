<template>
  <div class="analysis-container">
      <div class="ts-fd">
        <el-card class="box-card-ts">
            <div slot="header" class="clearfix">
                <span>News Summary</span>
            </div>
        </el-card>

        <el-card class="box-card">
            <div slot="header" class="clearfix">
                <span>Fraud Analysis</span>
            </div>
            <el-progress type="circle" :percentage="0"></el-progress>
        </el-card>
      </div>
      <div class="qa">
        <el-card class="box-card-qa">
            <div slot="header" class="clearfix">
                <span>Answer for Question</span>
            </div>
            <el-progress type="circle" :percentage="0"></el-progress>
        </el-card>
      </div>
  </div>
</template>

<script>
export default {
    name: 'Analysis',
    data() {
        return {
            //
        }
    },
    computed: {
        //
    },
    methods: {
        //
    },
}
</script>

<style lang="less" scoped>
.analysis-container {
    display: flex;
    flex-direction: column;
    height: 100%;
    width: 100%;
    .ts-fd {
        display: flex;
        flex-direction: row;
        margin: 0 auto;
        .ts {
            flex: 1;
            text-align: center;
            font-size: 1.5em;
            color: #f0f;
        }
        .fd {
            flex: 1;
            text-align: center;
            font-size: 1.5em;
            color: rgb(97, 21, 21);
        }
    }
}
.text {
    font-size: 14px;
  }

  .item {
    margin-bottom: 18px;
  }

  .clearfix:before,
  .clearfix:after {
    display: table;
    content: "";
  }
  .clearfix:after {
    clear: both
  }
  .clearfix {
      text-align: center;
  }

  .box-card {
    width: 150px;
    margin-left: 30px;
  }
  .box-card-ts {
    width: 70vh;
  }
  .qa {
      margin: 0 auto;
      padding-top: 15px;
  }
  .box-card-qa {
    width: calc(70vh + 180px);
  }
</style>