// Ref: http://www.d3noob.org/2014/01/tree-diagrams-in-d3js_11.html
// https://observablehq.com/@bumbeishvili/d3-v5-organization-chart<Paste>
// https://bl.ocks.org/Coola85/51a4bf6b231370cb56a6b7b8da2ff7a7
class Track {
  constructor() {
    window.addEventListener('load', () => {
      const margin = {top: 20, right: 120, bottom: 20, left: 120};
      const width = 960 - margin.right - margin.left;
      const height = window.innerHeight - margin.top - margin.bottom;
       
      this.config = {
        img: {
          width: 300,
          height: 200
        },
        card: {
          margin: 120,
        }
      };
      this.tree = d3.tree()
       .size([height, width]);

      this.svg = d3.select('body > .container')
	   .append('svg')
       .attr('width', width + margin.right + margin.left)
       .attr('height', height + margin.top + margin.bottom)
       .append('g')
       .attr('transform', `translate(${margin.left},${margin.top})`);
      this.root = this.transform(window.track); 
      this.update(this.root);
    });
  }
  transform(track) {
    return d3.stratify()
		.id(d => d.id)
		.parentId(d => d.parent_id)(track);
  }
  update(source) {
    const config = this.config;
    // Compute the new tree layout.
    var nodes = this.tree(source).descendants(),
     links = source.links();

    // Normalize for fixed-depth.
    nodes.forEach((d) => {
      d.y = d.depth * (config.img.height + config.card.margin); 
      // Might be an issue with multi-leaf
      d.x = d.x - config.img.width; 
    });

    // Declare the nodes¦
    var node = this.svg.selectAll('g.node')
     .data(nodes, function(d) { return d.id || (d.id = ++i); });
  

    // Enter the nodes.
    var nodeEnter = node.enter().append('a')
     .attr('class', 'node')
     .attr('xlink:href', d => d.data.resource.url)
     .attr('transform', (d) => `translate(${d.x},${d.y})`);

    nodeEnter.
      append('svg:image')
      .attr('width', config.img.width)
      .attr('height', config.img.height)
      .attr('xlink:href', `https://placekitten.com/${config.img.width}/${config.img.height}`)

    nodeEnter.append('text')
     .attr('x', 100)
     .attr('y', config.img.height)
     .attr('dy', '1em')
     .text((d) => d.data.name )
     .style('fill-opacity', 1);

    // Declare the links!
    var link = this.svg.selectAll('path.link')
     .data(links, (d) => d.target.id);

    // Enter the links.
    link.enter().insert('path', 'g')
     .attr('class', 'link')
     .attr('d', this.vlink.bind(config));

  }
  vlink(d) {
    const bottom = (this.img.height) + d.source.y;
    const middle = (this.img.width/2) + d.source.x;
    const center = (this.img.width + d.source.x + d.target.x) /2;
    return `M${middle},${bottom}C${center},${d.target.y} ${center},${bottom} ${d.target.x + this.img.width/2},${d.target.y}`;
  }
}
module.export = new Track();
