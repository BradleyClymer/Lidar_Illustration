clc
close all hidden 
f               = figure( 'NumberTitle' , 'Off' , 'Name' , 'Lidar Angle Illustration' , 'Units' , 'Normalized' , 'Position' , [ 0.55 0.2 0.4 0.4 ] )
axes
hold on
vec_angle       = @( a , b ) acosd( dot( a , b ) / ( norm( a ) * norm( b ) ) )  ;
source.pos      = [ 1 0 ]                                                       ;
target.pos      = [ -5 0 ]                                                      ;
target.angle    = 90 + 25/2                                                     ;
target.vec      = [ cosd( target.angle ) sind( target.angle ) ]                 ;
target.slope    = target.vec( 2 ) / target.vec( 1 )                             ;
target.theta    = atand( target.slope )                            
h.target        = plot( ( [ -1 1 ] * cosd( target.angle ) + target.pos( 1 ) )', ...
                        ( [ -1 1 ] * sind( target.angle ) + target.pos( 2 ) )' , 'LineSmoothing' , 'on' )

scatch.angle    = 180
scratch.vec     = [ cosd( target.angle ) sind( target.angle ) ]                 ;
scratch.bounds  = [ -0.5 0.5 ]                                                  ;

h.out           = plot( [ source.pos( 1 ) target.pos( 1 ) ] , [ source.pos( 2 ) , target.pos( 2 ) ] , 'LineSmoothing' , 'on' )

ret.angle       = 180 + 2 * target.theta                                              
ret.vec         = [ cosd( ret.angle ) sind( ret.angle ) ]                       ;
ret.position    = [ 10*[ 0 ret.vec( 1 ) ] + target.pos( 1 ) ;                   ...
                    10*[ 0 ret.vec( 2 ) ] + target.pos( 2 ) ]                   
h.ret           = plot( 10*[ 0 ret.vec( 1 ) ] + target.pos( 1 ) ,            	...
                        10*[ 0 ret.vec( 2 ) ] + target.pos( 2 ) ,            	...
                        'LineSmoothing' , 'on' , 'Color' , [ 1 0 0 ]  )
target.rot      = @( dummy ) 3^2 
target.rot( target )
% scratch.angle   = acosd( dot( ret.vec , scratch.vec ) / ( norm( ret.vec , scratch.vec ) )
scratch.theta   = vec_angle( scratch.vec , ret.vec )
dot( ret.vec , target.vec )

grid on

xlim( [ -6 1 ] )
axis equal
% ylim( [ -1 2 ] )
