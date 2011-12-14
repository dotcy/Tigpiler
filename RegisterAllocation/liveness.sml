structure LIVENESS =
sig
  datatype igraph = IGRAPH of {graph: IGraph.graph, 
                               tnode: Temp.temp -> IGraph.node,
                               gtemp: IGraph.node -> Temp.temp,
                               moves: (IGraph.node * IGraph.node) list}
  
  val interferenceGraph : Flow.flowgraph * Flow.Graph.node list -> 
                            igraph * (Flow.Graph.node -> Temp.temp list)
  
  val show : outstream * igraph -> unit
end
structure Liveness : LIVENESS =
struct
  datatype igraph = IGRAPH of {graph: IGraph.graph, 
                               tnode: Temp.temp -> IGraph.node,
                               gtemp: IGraph.node -> Temp.temp,
                               moves: (IGraph.node * IGraph.node) list}

                (* node to *)
  type liveSet = unit Temp.Table.table * temp list
  type liveMap = liveSet Flow.Graph.Table.table
  struct G = FLOW.Graph
    
  fun interferenceGraph ({control, def, use, ismove}, node::nodelist) = 
    let
      val igraph = Graph.newGraph()
      val tnode = IGraph.node Temp.Table.table
      val gtemp = Temp.temp Temp.Table.table
      val moves = []
      
      fun livein(node)
      let
        val usedTemps = G.Table.look(use, node)
        val defTemps = G.Table.look(def, node)
        val outTemps = liveout(node)
      in 
        (case usedTemps of NONE => ()
          | SOME (temp list) => 
          )
      end
      
      
      fun liveout(node)
      let
        val outTemps = []
        val sucTemps = G.succ(control, node)
      in
        app (fn node => outTemps := outTemps @ node) 
      end
    in
      
    end
  
        
  fun show (outstream * igraph) = ()
  
end