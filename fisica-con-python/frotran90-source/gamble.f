      program gamble2
c-----------------------------------------------------------------
c The gambler's ruin problem.
c programs calculates chances for a ganbler to win/loose
c The gambler plays till the goal is reached or all money lost
c-----------------------------------------------------------------
c input from a keyboard
c    number of trials
c    initial capital, goal
c output screen
c    number of trials, chances to win, games
c Attention!!!
c the code call subroutine 'gettim' to get current time
c that name is not unique, and may be different on different compilers
c-----------------------------------------------------------------
c written by: Alex Godunov
c last revision: November 2006
c-----------------------------------------------------------------
      implicit none
      integer init
      integer*4 ihour, imin, isec, imsec
      integer*4 x, y, money1, money2, luck, games, total, wins
      integer*4 it, itests
      real*4 rand, agames, awins, aloose

c initial seed number calculated from current time
      call gettim(ihour,imin,isec,imsec)
      init = imsec*isec*imin+ihour
      call srand(init)

      write (*,*)'The gambler`s ruin problem.'
      write (*,*)'Chances to reach certain goal'
      write (*,*)'enter numbers of tests, money and goal'
      read  (*,*) itests, money1, money2

c*** loop over trials
      total = 0
      wins = 0
      do it=1,itests
        x=money1
        games=0
        do while(x.gt.0.and.x.lt.money2)
           games = games + 1
           luck = 1
           if(rand().le.0.5) luck=-1
           x = x+luck
        end do
        total = total+games
        if(x.gt.0) wins = wins+1
      end do
c*** average number of games and wins
      agames = float(total)/float(itests)
      awins = float(wins)/float(itests)
	aloose = 1.0-awins
      write (*,100) itests, money1, money2
      write (*,101) awins, aloose, agames
100   format(/,' tests:   ',i7,/,' initial: ',i7,/,' goal:    ',i7)
101   format(' win   =',1pe12.3,/,' loose =',e12.3,/,' games =',e12.3)
      stop
      end