#course: cmps 3500
#lab05
#date: 3/12/20
#username: mmercado
#name: Ma Mikaela Mercado
#description: lab05.perl
use strict;
use warnings;
use Getopt::Long;

my $output;
my $input;
my %num = ();
my %score = ();
GetOptions("f=s" => \$data, "o=s" => \outfile) or die ("error\n"); 

if($output and $input){
    &readIn;
    &printCounts;
    &printID;
}
else {
    print "error\n";
}
sub readIn
{
    open(INFILE, "$input");
    opent(OUTFILE, '>',$output);
    my $totalLines = 0;
    my $num2;
    while(<INFILE)
    {
    my $line = $_;
    $line =~ s/([A-Za-z]+)?|L$1\E/;
    $line =~ m/(0-9]{3})\,([A-Za-z]+),(\d)\,(\d)\,(\d)\,(\d)\,(\d)\,(\d)\,(\d)\,(\d)\,(\d)\,(\d)/;
    @{$num{$1}} = $2;
    @{$score{$2}} = [$3,$4,$5,$6,$7,$8,$9,$10,$11,$12];
    my $i=0;
    foreach my $X (@{$score{$2}}) {
        for each my $score1 (@{$X}){
            if($score1){
            $correctCount[$i] +=1;
            }
            $i +=1;
        }
    }
    $num2 =~ s/([0-9])([0-9])([0-9])//;
    if ($2 >= 7)
    {
        print OUTFILE $line;
    }
    $totalLines +=1;
    }
    close(INFILE);
    close(OUTFILE);
    print "Lines read: $totalLines\n";
}
sub printCounts
{
    open(OUTFILE, '>>', $output);
    $num3 = 1;
    $highCount = 0;
    $bestCount = 0;
    print OUTFILE "total scores:\n";
    foreach my $i (@correctCount)
    {
        print OUTFILE "Test $num3: $i ";
        if($highCount < $i)
        {
            $highCount = $i;
            $bestCount = $num3;
        }
    print OUTFILE "\n Best Test Score: #$bestCount \n";
    close(OUTFILE);
}
sub printID{
    my $Reading = 1;
    while($Reading)
    {
        print "Type ID: ";
        my $num4 = <STDIN>;
        chomp $num4;
        $Reading = $num4;
        print "\n";
        if($Reading){
            if($num{$num4}){
                for my $name (@{num{num4}}){
                print "$num4 is $name\n";
                chomp $name;
                foreach my $num5 (@{score{$name}}){
                    for my $sc (@{num5}){
                        print "$sc";
                    }
                }
                print "\n";
                }
            }
            else {
                print "error id is not found\n";
            }
            }
     }
}


