@CommentBox = React.createClass
  # standard React methods
  getInitialState: ->
    return { data: []}
  componentDidMount: ->
    @loadCommentsFromServer()
    setInterval @loadCommentsFromServer, @props.pollInterval
  render: ->
    return (
      `<div className="commentBox">
        <h1>Comments</h1>
        <CommentList data={this.state.data}/>
        <CommentForm />
      </div>`
      )
  # custom methods
  loadCommentsFromServer: ->
    $.ajax
      url: @props.url
      dataType: 'json'
      success: (
        (data) ->
          @setState({data: data})
        )
        .bind @
      error: (
        (xhr, status, err) ->
          console.error @props.url, status, err.toString
        )
        .bind @

@CommentList = React.createClass
  render: ->
    commentNodes = @props.data.map (comment) ->
      return `<Comment author={comment.author}>{comment.text}</Comment>`

    return `<div className="commentList">{commentNodes}</div>`

@Comment = React.createClass
  render: ->
    return (
      `<div className="comment">
        <h2 className="commentAuthor">{this.props.author}</h2>
        <p>{this.props.children}</p>
      </div>`
      )

@CommentForm = React.createClass
  render: ->
    return `<div className="commentForm">Hello world! I am a CommentForm</div>`
