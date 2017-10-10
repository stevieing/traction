// app/javascript/sequencing-runs/components/SequencingRuns.vue

<template>
  <div id='sequencing-runs' class='row'>
    <div class="col-md-12">
      <table class="table table-striped">
        <thead>
          <th>Experiment name</th>
          <th>Instrument name</th>
          <th>Created</th>
          <th>&nbsp;</th>
          <th>&nbsp;</th>
        </thead>
        <tbody>
          <tr v-for="sequencing_run in sequencing_runs">
            <td>{{ sequencing_run.id }}</td>
            <td>{{ sequencing_run.instrument_name }}</td>
            <td>{{ sequencing_run.created_at }}</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</template>

<script>
  export default {
    name: 'SequencingRuns',
    data: function() {
      return {
        sequencing_runs: [],
        errors: {}
      }
    },
    methods: {
      fetchData: function() {
         this.$http.get('/sequencing_runs.json').then(response => {

          // get body data
          this.sequencing_runs = response.body;

        }, response => {
          // error callback
          console.error(response);
        });
      }
    },
    mounted: function() {
      this.fetchData()
    }
  }
</script>

<style scoped>
  p {
    font-size: 2em;
    text-align: center;
  }
</style>