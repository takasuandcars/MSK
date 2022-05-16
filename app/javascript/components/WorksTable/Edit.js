import React, { useState, useEffect } from 'react'



function Edit(props) {

    const[newStart, setNewStart] = useState(`${props.val.start}`)
    const[newEnd, setNewEnd] = useState(`${props.val.end}`)


    const SetNewStart = (val)=> {
        
        console.log(val)
       setNewStart(val);


    }
    const SetNewEnd = (val) => {
        setNewEnd(val);
    }
    const UpdateIsCompleted = (key,id) =>{
        var data = {
            id: id,
            start: newStart,
            end: newEnd

        }
        console.log(data);
        props.updateIsCompleted(key, data)

    }

    
return (
    <>
    {/* <%= form_with(model: @data, url: works_path(id: @data.id), method: :patch, remote: true, class: "form_with_css") do |f| %>
                <div class="tr td name-row"><%= @data.user.name %></div>
                <div class="tr td start-row">
                        <%= f.datetime_field :start, value: @data.start.strftime('%Y-%m-%dT%T') unless @data.start == nil %>
                        <%= f.datetime_field :start unless @data.start != nil %>
                </div>
                <div class="tr td end_row">
                        <%= f.datetime_field :end , value: @data.end.strftime('%Y-%m-%dT%T') unless @data.end == nil%>
                        <%= f.datetime_field :end unless @data.end != nil%>
                </div>
                <div class="tr td hours_row"><%= @data.hours %></div>
                <div class="tr td function_row">
                    <span><%= f.submit "保存", class: "btn"%></span>
         
                    <span class="btn"><%= link_to("削除", works_path(@data.id),method: :delete , remote: true)%></span>
                </div>
        <%end%> */}

        <form className="form_with_css" onSubmit={null}>
            <div className="tr td name-row"><input type="text" placeholder={`${props.val.name}`} /></div>
            <div className="tr td start-row"><input type="datetime-local" onChange={event => SetNewStart(event.target.value)}/></div>
            <div className="tr td end_row"><input type="datetime-local" onChange={event => SetNewEnd(event.target.value)}/></div>
            <div className="tr td hours_row"><input type="text" placeholder={`${props.val.hours}`}/></div>
            <div className="tr td function_row">
                <span className="btn" onClick={()=>UpdateIsCompleted(props.index, props.val.id)}>保存</span>
                <span className="btn">削除</span>
                <span className="btn" onClick={() => props.CancelBtn(props.index)}>キャンセル</span>
            </div>

        </form>
       
    </>

  )
}

export default Edit