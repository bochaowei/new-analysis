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
    props: {
        pkg: Object,
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
            question: '',
        }
    },
    computed: {
        //
    },
    methods: {
        //
        submit() {
            let ajax = new XMLHttpRequest();
            let _this = this;
            ajax.open("POST", "http://127.0.0.1:5000/api", true);
            ajax.setRequestHeader("Content-type", "application/json");
            ajax.onreadystatechange = function() {
                if (ajax.readyState == 4 && ajax.status == 200) {
                    let response = JSON.parse(ajax.responseText);
                    console.log(response);
                    _this.$emit('qa_back', response);
                }
            }.bind(this);
            ajax.send(JSON.stringify({
                text: this.pkg.text,
                title: this.pkg.title,
                author: this.pkg.author,
                question: this.question,
                service: 'qa'
                }
            ));
        },
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