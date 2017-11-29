// app/javascript/sequencing-runs/components/Metadata.vue

<template>
  <form class="metadata" @submit.prevent="onSubmit">
    <fieldset>
      <ul class="list-unstyled">
        <li>
          <label for="comment">Comment: </label>
          <input type="text" id="comment" v-model="sample.comment">
        </li>
        <li>
          <label for="size-selection"> Size Selection: </label>
          <input type="checkbox" id="size-selection" v-model="sample.sizeSelection">
        </li>
        <li>
          <label for="collection-time">Collection Time: </label>
          <input type="text" id="collection-time" v-model="sample.collectionTime">
        </li>
        <li>
          <label for="automation-parameters">Automation Parameters: </label>
          <input type="text" id="automation-parameters" v-model="sample.automationParameters">
        </li>
        <li>
          <button type="submit">Submit</button>
        </li>
      </ul>
    </fieldset>
  </form>
</template>

<script>
  export default {
    name: 'Metadata',
    props: ['sample','hidden'],
    data () {
      return {
        msg: 'Metadata'
      }
    },
    methods: {
      onSubmit () {
        this.$emit('hide')
      }
    },
    computed: {
    }
  }
</script>