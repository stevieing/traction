// app/javascript/sequencing-runs/components/Well.vue

<template>
  <td @dragover.prevent @drop="onDrop" @contextmenu="showMetadata" class='well'>
    <div v-html="sample.name"></div>
    <div v-html="sample.comment"></div>
    <div v-html="sample.sizeSelection"></div>
    <div v-html="sample.collectionTime"></div>
    <div v-html="sample.automationParameters"></div>
    <metadata :sample="sample" v-on:hide="hideMetadata" v-bind:class="{ hidden: metadataHidden }"></metadata>
  </td>
</template>

<script>

  import Metadata from '../components/Metadata'

  export default {
    name: 'Well',
    props: ['row', 'column'],
    data () {
      return {
        msg: 'Well',
        sample: {},
        metadataHidden: true
      }
    },
    methods: {
      onDrop (event) {
        event.preventDefault()
        var sample = JSON.parse(event.dataTransfer.getData("sample"))
        this.sample = sample
      },
      showMetadata(event) {
        event.preventDefault()
        if (Object.keys(this.sample).length > 0) {
          this.metadataHidden = false
        }
      },
      hideMetadata () {
        this.metadataHidden = true
      }
    },
    computed: {
      position () {
        return (this.row).concat(this.column)
      }
    },
    components: {
      Metadata
    }
  }
</script>