classdef ( ConstructOnLoad ) reflectiveBeam < handle
    %   This is a beam graphics object that will collide with another beam and
    %   reflect, and continue to do so until it no longer collides
    
    %
    properties
        start_pos       % start
        end_pos         % end
        angle           % propagation angle
        bounds
        slope
        theta
        children
        parent
        handle
    end
    
    methods
        function rb = reflectiveBeam( varargin )
            javax.swing.UIManager.setLookAndFeel('com.jgoodies.looks.plastic.Plastic3DLookAndFeel')
            if nargin == 0
                rb.start_pos	= [ 1 0 ]                                       ;
                rb.end_pos      = [ -5 0 ]                                      ;
                rb.angle        = vec_angle( rb.start_pos , rb.end_pos )        ;
            end
            
            if numel( varargin )
                if numel( varargin{ 2 } ) == 1                                          % this means the second argument is theta
                    rb.start_pos    = varargin{ 1 }                                 ;
                    rb.angle        = varargin{ 2 }                                 ;
                    rb.end_pos  	= rb.start_pos + realmax / 2 *                  ...
                                    [ cos( rb.angle )   sin( rb.angle ) ]           ;
                elseif numel( varargin{ 2 } ) == 2                                      % this means the second argument is an end vector
                    s           	= varargin{ 1 }                                 ;
                    e               = varargin{ 2 }                                 ;
                    rb.angle        = vec_angle( s , e )                            ;
                    rb.end_pos      = e                                             ;
                    rb.start_pos    = s                                             ;
                end
            end
            
            plot_vecs   = rb.extract_plot_vecs( rb.start_pos , rb.end_pos )         ;
            hold on
            rb.handle   = plot( gca , plot_vecs{ : } )                              ;
            axis equal
            grid on
            function t = vec_angle( a , b )
                t   = acosd( dot( a , b ) / ( norm( a ) * norm( b ) ) )             ;
            end
            
            
        end         % end constructor
        
        
        
        
        function p  = extract_plot_vecs( varargin )
            p   = cell( nargin-1 , 1 )                                          	;
            for i_input   = 2 : nargin
                for i_components = 1 : numel( varargin{ i_input } )
                    p{ i_components }( i_input-1 )   = varargin{ i_input }( i_components )    ;
                end
            end
        end         % end extract_plot_vecs
        
        
        
        
        function collision_check( beam , ref )
            v       = find_class( 'reflectiveObject' )                              ;
            for i = 1 : numel( v )
                [ intersect , distance ]    = find_intersection( rb , v( i ) )
%                 rb.collision_check( v( i ) )
            end
            
        end
    end             % end methods
    
    
    
    
    methods ( Static )
        function surfaces = check
            surfaces    = find_class( 'reflectiveObject' )                          ;
        end
    end
end