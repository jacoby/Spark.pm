package Spark ;

## Adapted from https://github.com/holman/spark

use 5.010 ;
use strict ;
use warnings ;
use Exporter qw(import) ;
use utf8 ;
use List::MoreUtils qw( minmax ) ;

our $VERSION = 0.0.1 ;
our @EXPORT  = qw{ spark } ;

sub spark {
    my @nums = @_ ;
    #my @nums = grep { ! /\D/ } @_ ;
    my @ticks = qw{ ▁ ▂ ▃ ▄ ▅ ▆ ▇ █ } ;
    my ( $min , $max ) = minmax @nums ;

    my $numer = $max - $min << 8 ;
    my $denom =  -1 + scalar @ticks ;
    my $f = int $numer / $denom ;
   
    my $output ;
    for my $n ( @nums ) {
        my $numer =( $n-$min << 8 ) ;
        my $t = int $numer / $f ;
        $output .= $ticks[$t] ;
        }
    return $output ;
    }

'spark' ;

