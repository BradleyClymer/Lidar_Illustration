function obj_struct = find_class( class_name )
    if nargin == 0
        class_name  = 'reflectiveObject'            ;
    end
    workspace   = 'base'                            ;
    w   = evalin( workspace , 'whos' )          	;
    if isempty( w )
        obj_struct  = []                            ;
        return
    end
    
    for i_vars = 1 : numel( w )
        if strcmp( w( i_vars ).class , class_name ) 
            obj_struct( i_vars )    = evalin( workspace , w( i_vars ).name )	; %#ok<AGROW>
        end
    end
    
    if ~exist( 'obj_struct' , 'var' )
        obj_struct = []                                                         ;
    else
        obj_struct( cellfun( @isempty , { obj_struct } ) ) = []                 ;
    end
end