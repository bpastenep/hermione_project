class TablesController < ApplicationController
	def demo
    respond_to do |format|
      format.json {
        page_size = params[:jtPageSize].to_i
        start_index = params[:jtStartIndex].to_i
        start_page = start_index / page_size + 1
        sort_by = params[:jtSorting].gsub('__', '.')
        filter = params[:filter]
        if filter
          @visitors_count = Question.joins(:purpose).
              where('question.purpose_id = purpose.id', "%#{filter}%", "%#{filter}%").size()
              paginate(:page => start_page, :per_page => page_size)
        else
          @visitors_count = Question.all.size()
          
              paginate(:page => start_page, :per_page => page_size)
        end
      }
      format.html {}
      format.js {}
    end
  end
  
  def demo_delete
    @visitor = Question.find(params[:id])
    if @visitor
      if @visitor.destroy
        render js: '{"Result":"OK"}'
      end
    end
  end

end
