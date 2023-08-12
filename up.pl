#!perl

use strict;
use warnings;

use 5.14.0;

my $up_file = "C:/Users/sumu/up.up";

my $ACTION = $ARGV[0] || '';
    chomp $ACTION;

my $TERM = $ARGV[1] || '';
    chomp $TERM;

my $POWERSHELL = "C:/Windows/System32/WindowsPowerShell/v1.0/powershell.exe";

my $DATE = `$POWERSHELL Get-Date -Format "yyyy-MM-dd-dddd-HH-mm-K"`;
    chomp $DATE;

#print "Action:$ARGV[0] Term:$ARGV[1]\n";

if ($ACTION ne '') {
    # search/results 
    if ( $ACTION eq 's' ) {
        print &result ( term => "$TERM"); 
    } 
    # Add a row 
    elsif ( $ACTION eq 'a' ) {
        print add( cont => "$TERM", date => "$DATE" );
    }
    # show total 
    elsif ( $ACTION eq 't' ) {
        print total( date => "$DATE" ); 
    }
    #
} else {
    # no params 
    print &usage();
}

=head2 Results

=cut

sub result {

    my %in = (
        term => '',
        @_,
    );
    #
    if ( -f "$up_file" and $in{term} ne '') {
    #
    if ( open( my $file, "<", "$up_file") ) {
        
        while ( my $line = <$file> ) {
            if ( $line =~ /$in{term}/i ) {
                return qq{\t$. $line};
            } else {
                return "No Match";
            }
        }
        #
        close $file; 

        } else {
            return "Unable to open file #41";
        }
        #
    
    } else {
        return "Open: Not OK or no arguments provided #45";
    }
    # 

}
# end result 

=head2 Add a record
    to FDB
=cut

sub add {

    #
    my %in = (
        cont => '',
        date => '',
        @_,
    );

    #
    if ( -f "$up_file" and $in{cont} ne '') {
    #
    if ( open( my $file, ">>", "$up_file") ) {
        
        print $file qq{$in{cont}\|$in{date}\n};
        #
        close $file;

        return qq{$in{cont}\|$in{date} was added to FDB};

    } else {
        return "Unable to open file for writing #79";
    }
    
    } else {
        return "Open: Not OK or no arguments provided #80";
    }
}
# end add 

=head2 Usage 
=cut

sub usage {
    return "USAGE\n\t$0 ACTION TERM\n";
}


=head2 Total 
=cut

sub total {
    #
    my %in = (
        date => '',
        total => '',
        @_,
    );

    #
    if ( -f "$up_file" ) {
    #
    if ( open( my $file, "<", "$up_file") ) {
        
        my @lines = <$file>;
        #
        close $file;

        $in{total} = scalar @lines;

        return qq{\tTotal rows: $in{total}\n\t$in{date}};

    } else {
        return "Unable to open file for writing #79";
    }
    
    } else {
        return "Open: Not OK or no arguments provided #80";
    }

}



1;

