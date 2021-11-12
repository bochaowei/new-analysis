<template>
  <div>
    <el-input
        placeholder="Pleas input authors' name, use ',' if there're multiple authors" v-model="authors">
    </el-input>
  </div>
</template>

<script>
export default {
    name: 'AuthorEntry',
    data() {
        return {
            authors: '',
        }
    },
    watch: {
        authors(val) {
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
