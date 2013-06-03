class PlayersDatatable
  delegate :params, :h, to: :@view

  def initialize(view)
    @view = view
  end

	# Override the as_json method with data we need to send to datatables
  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Player.count,
      iTotalDisplayRecords: players.total_entries,
      aaData: data
    }
  end

private

	#populates all of the data in all of the columns (has to be the same number of columns that are in teh index.html.erb)
  def data
    players.map do |player|
      [
        h(player.surname), 										#surname
        h(player.given_name),									#given_name
        h(player.avg),												#AVG -- calculated, not stored in the db
        h(player.home_runs),									#HR
        h(player.rbi),												#RBI
        h(player.runs),												#RUNS
        h(player.steals),											#SB
				h(player.obp)													#OPS -- calculated, not stored in the db
      ]
    end
  end

  def players
    @players ||= fetch_players
  end

	# filters out 
  def fetch_players
    players = Player.order("#{sort_column} #{sort_direction}")
    players = players.page(page).per_page(per_page)
    if params[:sSearch].present?
      players = players.where("surname like :search or given_name like :search", search: "%#{params[:sSearch]}%")
    end
    players
  end

	
  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = [
			"surname", 
			"given_name",
			# If division by zero is going to happen, set it to zero (no at_bats implies no hits)
			"(CASE at_bats WHEN 0 THEN 0 ELSE hits / CAST(at_bats as float) END)", 
			"home_runs",
			"rbi",
			"runs",
			"steals",
			# If division by zero is going to happen, set it to zero (use at_bats again since if that is zero, so is everything else)
			"((hits+walks+hit_by_pitch)/(CASE at_bats WHEN 0 THEN NULL ELSE (CAST(at_bats as float)+walks+hit_by_pitch+sacrifice_flies) END))"
		]
		#choose the option above based on the column index fed in
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end
