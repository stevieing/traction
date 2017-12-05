// app/javascript/sequencing-runs/components/SampleMetadata.vue

<template>
  <div class="row">
    <form class="metadata rounded" @submit.prevent="onSubmit">
      <fieldset>
        <div class="form-group">
          <label for="comment">Comment: </label>
            <input class="form-control" type="text" id="comment" v-model="sample.comment">
        </div>
        <div class="form-group">
          <label for="collection-time">Collection Time: </label>
            <input class="form-control" type="text" id="collection-time" v-model="sample.collectionTime">
        </div>
        <div class="form-group">
          <label for="automation-parameters">Automation Parameters: </label>
            <input class="form-control" type="text" id="automation-parameters" v-model="sample.automationParameters">
        
        </div>
        <div>
          <button class="btn btn-primary pull-right" type="submit">Submit</button>
        </div>
      </fieldset>
    </form>
  </div>
</template>

<script>
  export default {
    name: 'SampleMetadata',
    props: ['sample','hidden'],
    data () {
      return {
        msg: 'SampleMetadata'
      }
    },
    methods: {
      onSubmit () {
        this.$emit('hide')
        this.$parent.$emit('add', this.sample)
      }
    },
    computed: {
    }
  }
</script>