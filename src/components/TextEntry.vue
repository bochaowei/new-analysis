<template>
  <div>
    <el-input
        type="textarea"
        :rows="15"
        placeholder="Pleas input the content of News"
        v-model="textarea">
    </el-input>
  </div>
</template>

<script>
export default {
    name: 'TextEntry',
    data() {
        return {
            textarea: ''
        }
    },
    watch: {
        textarea(val) {
            this.$emit('inputChanged', val)
        }
    },
    computed:{
    }
}
</script>

<style lang="less" scoped>
.text_input {
    width: 100%;
    height: 100%;
}
</style>>
