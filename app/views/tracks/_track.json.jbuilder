json.extract! track, :id, :name, :created_at, :updated_at
json.tree track.step.subtree
json.url track_url(track, format: :json)
