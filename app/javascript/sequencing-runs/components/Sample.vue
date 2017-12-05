// app/javascript/sequencing-runs/components/Sample.vue

<template>
  <li draggable="true" @dragstart="drag" @dragend="hide" :id="sample.name"  class='sample list-group-item card-block' v-bind:class="classObject" v-on:click="active = !active">
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
        active: false,
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
      },
      show (event) {
        this.hidden = false
      }
    },
    computed: {
      classObject () {
        return {
          active: this.active,
          hidden: this.hidden
        }
      }
    }
  }
</script>