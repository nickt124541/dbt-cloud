with support_tickets as (
        select
        ticket_id,
        customer_id,
        subject                           as ticket_subject,
        category                          as ticket_category,
        priority                          as ticket_priority,
        status                            as ticket_status,
        created_at::timestamp             as ticket_created_at
    from support.tickets
),

support_resolutions as (
        select
        resolution_id,
        ticket_id,
        resolved_by                       as resolved_by_agent_id,
        resolution_note,
        resolved_at::timestamp            as resolved_at
    from support.resolutions
),

support_agents as (
        select
        agent_id,
        name                              as agent_name,
        team                              as agent_team,
        joined_at::date                   as joined_at
    from support.agents
),

support_ticket_assignments as (
        select
        assignment_id,
        ticket_id,
        agent_id,
        assigned_at::timestamp            as assigned_at
    from support.ticket_assignments
)

select * from ticket_assignments