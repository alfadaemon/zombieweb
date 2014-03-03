    var bgpg;
    var goodGuy ;
	var badguys1 ;
	var badguys2 ;
	
	var letmove1;
	var letmove2;
	var stepA;
	var stepB;
	
Molecule(600, 400, function (game, require) {

    //game.assets = require('assets');
    
	var countsteps = 0;
	
	//var AudioGame = game.audio.load(['music.wav'])
	
    // Create sprite

	 bgpg =   game.sprite.load('/assets/schooll1.jpg')
     goodGuy = game.sprite.load('/assets/animationBoy.png',37,50);
	 badguys1 = game.sprite.load('/assets/animationKiller1.png',41,50);
	 badguys2 = game.sprite.load('/assets/animationKiller1.png',41,50);
	
	
    game.init(function () {
    goodGuy.animation.add('idle', [0,1,2,3,4], 1);
	goodGuy.animation.add('stage1', [5], 1);
	goodGuy.animation.add('stage2', [6], 1);
	goodGuy.animation.add('stage3', [7], 1);
	goodGuy.animation.add('stage4', [8], 1);
	goodGuy.animation.add('stage5', [9], 1);
	
	
	goodGuy.animation.run('idle');
	goodGuy.position.x = 160;
    goodGuy.position.y = 340;
	goodGuy.speed.max.x = 1;
	goodGuy.speed.max.y = 0;
	
	//badguys init 1	
	badguys1.animation.add('idleBadGuy', [3,4], 1);
	badguys1.animation.add('walking',[0,1,2,3],1);
	
	badguys1.animation.run('idleBadGuy');
	badguys1.position.x = game.width - 100;
	badguys1.position.y = 280;
	
		
	//badguys init 2	
	badguys2.animation.add('idleBadGuy', [3,4], 1);
	badguys2.animation.add('walking',[0,1,2,3],1);
	badguys2.position.x = game.width - 100;
	badguys2.position.y = 340;
	

        // Change sprite position
		bgpg.position.x = 1;
        bgpg.position.y = 1;
        
        // Change sprite alpha
         bgpg.alpha = 0.75;
        
        // Change sprite rotation (degrees)        
        bgpg.rotation = 0;
                       
        // Hide sprite        
		bgpg.visible = true;
        
        // Flip sprite
        
		bgpg.flip.x = false;
        bgpg.flip.y = false;
        
        // Get sprite width and height
        bgpg.width = game.width;
        bgpg.height = game.height;
					
    letmove1 = false;
	letmove2 = false;
	
	stepA = 'A';
	stepB = "A";
	
	//AudioGame.play(false);

    });
    
    game.update(function () {
		if(letmove1){
			badguys1.position.x += -1;					
		}
		if(letmove2){
			badguys2.position.x += -1;
		
		}
		
		if(stepA == 'A' && badguys1.position.x < 400 ){
			letmove1 = false;
			stepA = 'B';
			badguys1.animation.run('idleBadGuy');
		}
		if(stepA == 'B' && badguys1.position.x < 300 ){
			letmove1 = false;
			stepA = 'C';
			badguys1.animation.run('idleBadGuy');
		}		
		if(stepA == 'C' && badguys1.position.x < 200 ){
			letmove1 = false;
			stepA = 'D';
			badguys1.animation.run('idleBadGuy');
		}
		
		//
		if(stepB == 'A' && badguys2.position.x < 400 ){
			letmove2 = false;
			stepB = 'B';
			badguys2.animation.run('idleBadGuy');
		}
		if(stepB == 'B' && badguys2.position.x < 300 ){
			letmove2 = false;
			stepB = 'C';
			badguys2.animation.run('idleBadGuy');
		}
		if(stepB == 'C' && badguys2.position.x < 200 ){
			letmove2 = false;
			stepB = 'D';
			badguys2.animation.run('idleBadGuy');
		}
    });
	
	
});