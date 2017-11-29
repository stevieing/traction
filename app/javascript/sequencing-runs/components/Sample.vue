// app/javascript/sequencing-runs/components/Sample.vue

<template>
  <li draggable="true" @dragstart="drag" @dragend="hide" :id="sample.name"  class='sample' v-bind:class="classObject" v-on:click="selected = !selected">
    {{ sample.name }}
  </li>
</template>

<script>
  export default {
    name: 'Sample',
    props: ['sample'],
    data () {
      return {
        msg: 'Sample',
        selected: false,
        hidden: false
      }
    },
    methods: {
      drag (event) {
        var sample = JSON.stringify(this.sample)

        event.dataTransfer.setData("sample", sample)
      },
      hide (event) {
        this.hidden = true
      }
    },
    computed: {
      classObject () {
        return {
          selected: this.selected,
          hidden: this.hidden
        }
      }
    }
  }
</script>