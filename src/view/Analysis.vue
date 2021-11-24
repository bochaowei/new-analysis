<template>
  <div class="analysis-container">
    <el-dialog
        style="font-family: lobster;"
        title="Want to ask more questions ?"
        :visible.sync="QADialogVisible"
        width="70%"
        center
        append-to-body>
        <QADialog :pkg="pkg" v-on:qa_back="add_qa" />
    </el-dialog>
    <el-button type="primary" @click="askNewQuestion" class="new-question">
      QA
    </el-button>
      <div class="ts-fd">
        <el-card class="box-card-ts">
            <div slot="header" class="clearfix">
                <span>News Summary</span>
            </div>
            <p class="summary">{{summary}}</p>
        </el-card>

        <el-card class="box-card">
            <div slot="header" class="clearfix">
                <span>Fraud Analysis</span>
            </div>
            <el-progress type="circle" :percentage="fraud_score"></el-progress>
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
    props: {
        response: Object,
        pkg: Object,
    },
    components: {
        QADialog
    },
    data() {
        return {
            qa_obj: [],
            summary: '',
            fraud_score: 0,
            QADialogVisible: false,
        }
    },
    computed: {
    },
    watch: {
        response: {
          handler(val){
            let answer_ = val["data"]["answer"];
            let question_ = val["data"]["question"];
            let summary = val["data"]["summary"];
            let fraud_score = parseFloat((val["data"]["fruad"] * 100).toFixed(1));
            if(summary != null) {
              this.summary = summary;
              this.qa_obj = [];
            }
            if(fraud_score != null) {
              this.fraud_score = fraud_score;
            }
            if(answer_ != null) {
              this.qa_obj.push({
                question: question_,
                answer: answer_
              });
            }
          },
          deep: true,
          immediate: true
        }
    },
    methods: {
        //
        add_qa(response) {
          console.log(response);
          let question_ = response["data"]["question"];
          let answer_ = response["data"]["answer"];
          this.QADialogVisible = false;
          this.qa_obj.push({
              question: question_,
              answer: answer_
          });
        },
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
      font-family: monospace;
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
  .qa-content {
      font-family: monospace;
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
  .summary {
    font-family: monospace;
  }
</style>