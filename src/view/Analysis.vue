<template>
  <div class="analysis-container">
    <el-dialog
        style="font-family: lobster;"
        title="Want to ask more questions ?"
        :visible.sync="QADialogVisible"
        width="70%"
        center
        append-to-body>
        <QADialog />
    </el-dialog>
    <el-button type="primary" @click="askNewQuestion" class="new-question">
      QA
    </el-button>
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
      <div v-for="obj in qa_obj" class="qa">
        <div class="qa">
          <el-card class="box-card-qa">
              <div slot="header" class="clearfix">
                  <span>{{obj.question}}</span>
              </div>
              <div class="qa-content">
                  <span>{{obj.answer}}</span>
              </div>
          </el-card>
        </div>
      </div>
      
  </div>
</template>

<script>
import QADialog from './QADialog.vue'
export default {
    name: 'Analysis',
    components: {
        QADialog
    },
    data() {
        return {
            qa_obj: [
              {
                question: 'What is the purpose of this project?',
                answer: 'This project is to help people to understand the news and to make a decision about whether to read the news or not.'
              },
              {
                question: 'What is the purpose of this project?',
                answer: 'This project is to help people to understand the news and to make a decision about whether to read the news or not.'
              },
            ],
            QADialogVisible: false,
        }
    },
    computed: {
        //
    },
    methods: {
        //
        askNewQuestion() {
            this.QADialogVisible = true;
        },
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
    width: 80vh;
  }
  .qa {
      margin: 0 auto;
      padding-top: 15px;
  }
  .box-card-qa {
    width: calc(80vh + 180px);
  }
  .new-question {
    width: 5vw;
    height: 4vh;
    position: absolute;
    right: 30px;
    top: 300px;
    font-family: lobster;
  }
</style>