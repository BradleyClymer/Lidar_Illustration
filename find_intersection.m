function [ intersection , distance ]   = find_intersection( p , q )
    dp          = p.end_pos - p.start_pos                               ;
    dq          = q.end_pos - q.start_pos                               ;
    qpx         = q.start_pos( 1 ) - p.start_pos( 1 )                   ;
    qpy         = q.start_pos( 2 ) - p.start_pos( 2 )                   ;
    d           = dp( 1 ) * dq( 2 ) - dp( 2 ) * dq( 1 )                 ;
    t           = ( dq( 2 ) * ( qpx ) - dq( 1 ) * qpy ) / d             ;
    s           = ( dp( 1 ) * ( qpy ) - dq( 2 ) * qpx ) / d             ;
    
    if ~d
        intersection = []                                               ;
        disp( 'No intersection.' )
    else
        intersection    = p.start_pos + t * ( dp )                      ;
        distance        = norm( intersection - p.start_pos )            ;
    end
end