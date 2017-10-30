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
    <div :sequencing-run="sequencing-run">
      <div>
        <label for="experiment_name">Experiment Name:</label>
        <!-- Input -->
        <input type="text" v-model="sequencing_run.experiment_name"><br>
        <!-- Validation errors -->
        <span style="color:red">{{ errors.experiment_name }}</span>
      </div>
      <div>
        <label for="instrument Name">Instrument Name:</label>

        <!-- Input -->
        <input type="text" v-model="sequencing_run.instrument_name"><br>
        <!-- Validation errors -->
        <span style="color:red">{{ errors.instrument_name }}</span>
      </div>
      <div><button @click="createSequencingRun">Submit</button></div>
    </div>
  </div>
</template>

<script>
  export default {
    name: 'SequencingRuns',
    data: function() {
      return {
        sequencing_runs: [],
        sequencing_run: {
          experiment_name: "",
          instrument_name: ""
        },
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
      },
      createSequencingRun: function () {
        this.$http.post('/sequencing_runs.json', this.sequencing_run).then(response => {

          // get body data
          this.errors = {}
          this.sequencing_runs.push(response.body);

        }, response => {
          // error callback
          this.errors = response.body.errors;
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