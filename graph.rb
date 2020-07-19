require 'technical_graph'

def fern( delta, x0=0.5, count=500 )
  x = x0
  count.times do |k|
    yield k, x
    x += x*(1.0-x)*delta
  end
end

gr = TechnicalGraph.new
[0.5,0.9,1.2,2.1].each do |delta|
  data = []
  fern( delta, 0.5, 100 ) do |x,y|
    data << { x: x, y: y}
  end
  gr.add_layer( data )
  puts delta
end

gr.save_to_file 'fern.png'