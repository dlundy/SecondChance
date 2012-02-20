jQuery(function(){
	Member.init();
});


var Member = function(){
	
	return {
		
		init:function(){
			jQuery('.confirm_member_link').click(Member.confirm);
			jQuery('.block_member_link').click(Member.block);
		},
		
		confirm:function(){
			myLink = jQuery(this);
			var memberId = myLink.attr('data-member-id');
			jQuery.ajax({
				url: '/refinery/members/' + memberId + '/confirm',
				type: 'post',
				success:function(){
					myLink.replaceWith('<a href="javascript:void(0)" class="block_member_link" data-member-id=' + memberId +'>Block</a>');
					jQuery('.block_member_link').click(Member.block);
				}
			});
		},
		
		block:function(){
			myLink = jQuery(this);
			var memberId = myLink.attr('data-member-id');
			jQuery.ajax({
				url: '/refinery/members/' + memberId + '/block',
				type: 'post',
				success:function(){
					myLink.replaceWith('<a href="javascript:void(0)" class="confirm_member_link" data-member-id=' + memberId +'>Confirm</a>');
					jQuery('.confirm_member_link').click(Member.confirm);
				}
			});
		}
	}
	
}();