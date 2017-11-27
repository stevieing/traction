/* eslint no-console: 0 */

import Vue from 'vue'
import SequencingRuns from './components/SequencingRuns.vue'
import VueResource from 'vue-resource';

Vue.use(VueResource);

if (process.env.NODE_ENV == 'test') {
  // Vue generates warning if we aren't in the production environment
  // These clutter up the console, but we don't want to turn them off
  // everywhere as they may be useful if we ever end up accidentally
  // running production in development mode. Instead we turn them off
  // explicitly
  Vue.config.productionTip = false
}


document.addEventListener('DOMContentLoaded', () => {

  Vue.http.headers.common['X-CSRF-Token'] = document.querySelector('meta[name="csrf-token"]').getAttribute('content')

  if ( document.getElementById('sequencing-runs') ) {
    /* The files-list element isn't on all pages. So only initialize our
    * Vue app if we actually find it */


    var app = new Vue({
      el: '#sequencing-runs',
      render: h => h(SequencingRuns)
    });
  }
})