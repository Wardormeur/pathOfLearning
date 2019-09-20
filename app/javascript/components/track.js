class Track {
  constructor() {
    window.addEventListener('load', () => {
      const nodes = [];
      const edges = [];
      /*var nodes = new vis.DataSet([
        {id: 1, label: 'Node 1'},
        {id: 2, label: 'Node 2'},
        {id: 3, label: 'Node 3'},
        {id: 4, label: 'Node 4'},
        {id: 5, label: 'Node 5'}
      ]);

      // create an array with edges
      var edges = new vis.DataSet([
        {from: 1, to: 3},
        {from: 1, to: 2},
        {from: 2, to: 4},
        {from: 2, to: 5},
        {from: 3, to: 3}
      ]);
      */

      // create a network
      var container = document.getElementById('mynetwork');
      if (container) {
        track.forEach((step) => {
          nodes.push({ id: step.id, label: step.name });
          if (step.parent_id) {
            edges.push({ from: step.parent_id, to: step.id });
          }
        });
        var data = {
          nodes: nodes,
          edges: edges
        };
        var options = {};
        var network = new vis.Network(container, data, options);
      }
    });
  }
}
module.export = new Track();
