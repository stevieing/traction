// app/javascript/sequencing-runs/components/Well.vue

<template>
  <td @dragover.prevent @drop="onDrop" @contextmenu="showMetadata" class='well' v-on:click="selected = !selected" v-bind:class="classObject">
    <div draggable="true" @dragstart="drag" @dragend="removeSample" >
      <div v-html="sample.name"></div>
      <div v-html="sample.comment"></div>
      <div v-html="sample.collectionTime"></div>
      <div v-html="sample.automationParameters"></div>
      <metadata :sample="sample" v-on:hide="hideMetadata" v-on:add="addMetadata" v-bind:class="{ hidden: metadataHidden }"></metadata>
    </div>
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
        metadataHidden: true,
        selected: false
      }
    },
    methods: {
      onDrop (event) {
        event.preventDefault()
        var sample = JSON.parse(event.dataTransfer.getData("sample"))
        this.addSample(sample)
      },
      showMetadata (event) {
        event.preventDefault()
        if (Object.keys(this.sample).length > 0) {
          this.metadataHidden = false
        }
      },
      addSample (sample) {
        this.sample = sample
      },
      drag (event) {
        var sample = JSON.stringify(this.sample)

        event.dataTransfer.setData("sample", sample)
      },
      removeSample (event) {
        this.sample = {}
      },
      hideMetadata () {
        this.metadataHidden = true
      },
      addMetadata (sample) {
        this.sample.comment = sample.comment
        this.sample.collectionTime = sample.collectionTime
        this.sample.automationParameters = sample.automationParameters
      }
    },
    computed: {
      position () {
        return (this.row).concat(this.column)
      },
      classObject () {
        return {
          selected: this.selected
        }
      }
    },
    components: {
      Metadata
    }
  }
</script>