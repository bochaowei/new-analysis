<template>
  <div>
    <el-input
        placeholder="Pleas input your question" v-model="question">
    </el-input>
  </div>
</template>

<script>
export default {
    name: 'QuestionEntry',
    data() {
        return {
            question: '',
        }
    },
    watch: {
        question(val) {
            this.$emit('inputChanged', val)
        }
    },
}
</script>

<style lang="less" scoped>
</style>>
