class Track {
  constructor() {
    window.addEventListener('load', () => {
      const nodes = [];
      const edges = [];

      // create a network
      var container = document.getElementById('mynetwork');
      if (container) {
        track.forEach((step) => {
          // const template = new NodeTemplate(step)
          nodes.push({ id: step.id, 
            label: step.name,
            step: step,
            //image: template.toSVG(), 
            // shape: 'image', 
            image: 'https://placekitten.com/300/200',
            shape: 'image',
            scaling: {
              min: 30, 
              max: 50,
            }, 
            fixed: true, // Only for preview
          });
          if (step.parent_id) {
            edges.push({ from: step.parent_id, to: step.id });
          }
        });
        nodes[0].x = 1;
        nodes[0].y = 2;
        var data = {
          nodes: nodes,
          edges: edges
        };
        var options = {
          layout: {
            hierarchical: { 
              direction: 'UD',
            }
          }
        };
        var network = new vis.Network(container, data, options);
        network.on('click', (params) => {
          const node = nodes.find(node => params.nodes[0] === node.id);
          window.open(node.step.resource.url, '_blank');
        });
      }
    });
  }
}
class NodeTemplate {
  constructor(step) {
    this.step = step;
  }
  toSVG() {
     const template = `<svg xmlns="http://www.w3.org/2000/svg" width="390" height="65">
          <foreignObject x="15" y="10" width="100%" height="100%">
          <div xmlns="http://www.w3.org/1999/xhtml" >
            <img src="https://placekitten.com/300/200"/>
            <div class="content">
              <h2>${this.step.name}</h2>
            </div>
          </div>
          </foreignObject>
          </svg>`;

      return `data:image/svg+xml;charset=utf-8, ${encodeURIComponent(template)}`;
  }
}

module.export = new Track();
