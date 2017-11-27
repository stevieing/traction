// app/javascript/sequencing-runs/components/Well.vue

<template>
  <td @dragover.prevent @drop="onDrop" class='well'>
    <div v-html="sample.name"></div>
  </td>
</template>

<script>
  export default {
    name: 'Well',
    props: ['row', 'column'],
    data () {
      return {
        msg: 'Well',
        sample: ''
      }
    },
    methods: {
      onDrop (event) {
        event.preventDefault()
        var sample = JSON.parse(event.dataTransfer.getData("sample"))
        this.sample = sample
      }
    },
    computed: {
      position () {
        return (this.row).concat(this.column)
      }
    }
  }
</script>