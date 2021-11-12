<template>
  <div>
    <el-input
        placeholder="Pleas input title" v-model="title">
    </el-input>
  </div>
</template>

<script>
export default {
    name: 'TitleEntry',
    data() {
        return {
            title: '',
        }
    },
    watch: {
        title(val) {
            this.$emit('inputChanged', val)
        }
    },
}
</script>

<style lang="less" scoped>
.text_input {
    width: 100%;
    height: 100%;
}
</style>>
