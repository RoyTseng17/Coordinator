 #事件觸發協調器
 struct Coordinator
    init_q::PriorityQueue
    time_q::PriorityQueue
    Coordinator() = new(PriorityQueue(), PriorityQueue())
end
#初始化時間heap
function init_heap!(coor::Coordinator, rs_time_dict)
    q = coor.time_q
    for (rs_id, time) in rs_time_dict
        q[rs_id] = time
    end
end

#重新復歸
function reset!(coor::Coordinator)
    coor.time_q = deepcopy(coor.init_q)
end
#發出排程請求
function send_request!(coor::Coordinator)
    #取得最早需要排程的資源id
    key_value = peek(coor.time_q)
    # dequeue!(coor.time_q)
    return key_value
end
#更新某rs_id資源的下次排程時間 (派工排程之後)
function update!(coor::Coordinator, rs_id::String, time::Int)
    coor.time_q[rs_id] = time
    # @show rs_id
    # @show coor.time_q[rs_id]
end