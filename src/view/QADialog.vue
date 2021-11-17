<template>
  <div class="qa-dialog-container">
        <el-input class=input-bar
        placeholder="Pleas input your question" v-model="question">
        </el-input>
        <el-button type="primary" @click="submit" class=submit-btn>Submit</el-button>
  </div>
</template>

<script>
export default {
    name: 'QADialog',
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
            question: '',
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
.qa-dialog-container {
    display: flex;
    flex-direction: column;
}

.input-bar {
    width: 80%;
    height: 20%;
    margin: 0 auto;
    border-radius: 5px;
    :hover {
        border: 1px solid rgb(85, 23, 23);
    }
}

.submit-btn {
    width: 5vw;
    height: 4vh;
    margin: 0 auto;
    margin-top: 3vh;
    font-family: lobster;
}
</style>