<template>
    <div class=font>
        <h1>Welcome to QSF News Analysis System!</h1>
        <p style="font-size: 25px;">
        QSF NA is a web application that allows you to analysis NEWS articles. It provides you with Fraud Dectetion, Question Answering and News Summarization.
        </p>
        <el-dialog
        title="Analysis Result"
        :visible.sync="centerDialogVisible"
        width="70%"
        center>
        <Analysis :response="response" :pkg="pkg" />
        </el-dialog>
        <div class="welcome-container">
            <div class="welcome-container-item">
                <el-card class="box-card-title">
                    <div slot="header" class="clearfix">
                        <span class=card-header>Title</span>
                    </div>
                    <TitleEntry class="welcome-feature-item" v-on:inputChanged="titleChanged" style="height:10vh;"/>
                </el-card>

                <el-card class="box-card-text">
                    <div slot="header" class="clearfix">
                        <span class=card-header>Text</span>
                    </div>
                    <TextEntry class="welcome-feature-item" v-on:inputChanged="textChanged" style="height:40vh;"/>
                </el-card>   
            </div>
            <div class="welcome-container-item">
                <el-card class="box-card-author">
                    <div slot="header" class="clearfix">
                        <span class=card-header>Author</span>
                    </div>
                    <AuthorEntry class="welcome-feature-item" v-on:inputChanged="authorChanged" style="height:10vh;"/>
                </el-card>

                <el-card class="box-card-question">
                    <div slot="header" class="clearfix">
                        <span class=card-header>Question</span>
                    </div>
                    <QuestionEntry class="welcome-feature-item" v-on:inputChanged="questionChanged" style="height:10vh;"/>
                </el-card> 
                <el-button tpye="primary" :loading="isLoading" style="margin-top: 5vh; font-family: lobster;" @click="handleAnalysis">Analysis</el-button>
            </div>
        </div>
    </div>
</template>

<script>

import TitleEntry from '../components/TitleEntry.vue';
import AuthorEntry from '../components/AuthorEntry.vue';
import QuestionEntry from '../components/QuestionEntry.vue';
import TextEntry from '../components/TextEntry.vue';
import Analysis from './Analysis.vue';

export default {
    name: 'Welcome',
    components: {
        TitleEntry,
        AuthorEntry,
        QuestionEntry,
        TextEntry,
        Analysis
    },
    data() {
        return {
            centerDialogVisible: false,
            text: '',
            title: '',
            author: '',
            question: '',
            response: {},
        }
    },
    created() {
    },
    methods: {
        textChanged(val) {
            this.text = val;
        },
        titleChanged(val) {
            this.title = val;
        },
        authorChanged(val) {
            this.author = val;
        },
        questionChanged(val) {
            this.question = val;
        },

        checkInput() {
            if (this.text == '' || this.title == '') {
                alert('Please fill in required fields! Text and Title are required fields.');
                return false;
            }
            return true;
        },

        handleAnalysis() {
            if(!this.checkInput()) return ;
            let ajax = new XMLHttpRequest();
            let _this = this;
            ajax.open("POST", "http://127.0.0.1:5000/api", true);
            ajax.setRequestHeader("Content-type", "application/json");
            ajax.onreadystatechange = function() {
                if (ajax.readyState == 4 && ajax.status == 200) {
                    let response = JSON.parse(ajax.responseText);
                    _this.response = response;
                    this.centerDialogVisible = true;
                }
            }.bind(this);
            ajax.send(JSON.stringify({
                text: this.text,
                title: this.title,
                author: this.author,
                question: this.question,
                service: 'all'
                }
            ));
        }
    },
    computed: {
        isLoading() {
            return this.centerDialogVisible;
        },
        pkg() {
            return {
                text: this.text,
                title: this.title,
                author: this.author,
            }
        }
    }
}
</script>

<style lang="less" scoped>
.welcome-container {
    display: flex;
    flex-direction: row;

    .welcome-container-item {
        flex: 1;
        height: 80vh;
        flex-direction: column;
    }
    .welcome-feature-item {
        display: flex;
        align-items: center;
    }
}

.font {
    font-family: lobster;
}

.card-header {
    font-weight: bold;
    font-family: lobster;
    font-size: 30px;
}

.box-card-title {
    margin: 1vh;
}

.box-card-text {
    margin: 1vh;
}

.box-card-author {
    margin: 1vh;
}

.box-card-question {
    margin: 1vh;
}

</style>>

</style>